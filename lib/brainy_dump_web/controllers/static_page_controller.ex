defmodule BrainyDumpWeb.StaticPageController do
  use BrainyDumpWeb, :controller
  require Logger

  def index(conn, _params) do
    html(conn, File.read!("#{:code.priv_dir(:brainy_dump)}/static/index.html"))
  end
end
