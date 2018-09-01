defmodule BrainyDumpWeb.Router do
  use BrainyDumpWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BrainyDumpWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", StaticPageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrainyDumpWeb do
  #   pipe_through :api
  # end
end
