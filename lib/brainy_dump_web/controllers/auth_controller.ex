defmodule BrainyDumpWeb.AuthController do
  use BrainyDumpWeb, :controller
  alias BrainyDump.Repo
  alias BrainyDumpWeb.UserFromAuth
  alias BrainyDumpWeb.User
  import Ecto.Query, only: [from: 2]
  require Logger
  plug(Ueberauth)

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        new_conn = BrainyDump.Guardian.Plug.sign_in(conn, user, %{}, ttl: {4, :days})
        jwt = BrainyDump.Guardian.Plug.current_token(new_conn)
        # {:ok, claims} = BrainyDump.Guardian.Plug.claims(new_conn)
        # exp = Map.get(claims, "exp")

        conn
        |> put_session(:current_user, user)
        |> configure_session(drop: true)
        |> BrainyDump.Guardian.Plug.sign_in(user)
        |> create_user_if_doesnt_exist()
        |> redirect(to: "/login_redirect?loggedIn=true&token=" <> jwt)

      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/login_redirect?loggedIn=false")
    end
  end

  def logout(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/login_redirect")
  end

  def create_user_if_doesnt_exist(conn) do
    Logger.warn(inspect(BrainyDump.Guardian.Plug.current_claims(conn)))

    user_id = BrainyDump.Guardian.Plug.current_claims(conn)["sub"]

    unless(Repo.exists?(User, where: :id == user_id)) do
      user = User.changeset(%User{}, %{id: user_id})
      Repo.insert(user)
    end

    conn
  end
end
