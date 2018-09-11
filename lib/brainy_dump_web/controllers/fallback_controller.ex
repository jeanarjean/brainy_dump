defmodule BrainyDumpWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use BrainyDumpWeb, :controller
  require Logger

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(BrainyDumpWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(BrainyDumpWeb.ErrorView, "error.json", :not_found)
  end

  def call(conn, something) do
    Logger.warn(inspect something)
    conn
    |> put_status(:not_found)
    |> render(BrainyDumpWeb.ErrorView, "error.json", :not_found)
  end
end
