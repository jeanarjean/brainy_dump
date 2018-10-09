defmodule BrainyDumpWeb.Router do
  use BrainyDumpWeb, :router
  require Ueberauth

  pipeline :browser do
    plug(:accepts, ["tml"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
  end

  scope "/", BrainyDumpWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", StaticPageController, :index)
    get("/posts/*wildcard", StaticPageController, :index)
    get("/tags/*wildcard", StaticPageController, :index)
    get("/logout", AuthController, :logout)
  end

  scope "/auth", BrainyDumpWeb do
    pipe_through(:browser)

    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
    post("/:provider/callback", AuthController, :callback)
  end

  scope "/api", BrainyDumpWeb do
    pipe_through(:api)

    resources("/posts", PostController, except: [:new, :edit])
    resources("/tags", TagController, except: [:new, :edit])
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrainyDumpWeb do
  #   pipe_through :api
  # end
end
