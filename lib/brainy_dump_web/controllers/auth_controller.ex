defmodule BrainyDumpWeb.AuthController do
  use BrainyDumpWeb, :controller
  alias BrainyDumpWeb.UserFromAuth
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
        new_conn = BrainyDump.Guardian.Plug.sign_in(conn, user)
        jwt = BrainyDump.Guardian.Plug.current_token(new_conn)
        # {:ok, claims} = BrainyDump.Guardian.Plug.claims(new_conn)
        # exp = Map.get(claims, "exp")

        conn
        |> put_session(:current_user, user)
        |> configure_session(drop: true)
        |> BrainyDump.Guardian.Plug.sign_in(user)
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
end
