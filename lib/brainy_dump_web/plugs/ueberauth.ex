defmodule BrainyDumpWeb.Plugs.Ueberauth do
  import Plug.Conn
  use Phoenix.Controller, namespace: BrainyDumpWeb

  def init(params), do: params

  def call(conn, _params) do
    user = get_session(conn, :current_user)

    case user do
      nil ->
        conn
        |> redirect(to: "/")
        |> halt

      _ ->
        conn
        |> assign(:current_user, user)
    end
  end
end
