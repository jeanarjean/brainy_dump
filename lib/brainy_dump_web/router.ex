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
    plug(:fetch_session)
  end

  pipeline :auth_api do
    plug(BrainyDump.Plugs.AuthPipeline)
  end

  scope "/auth", BrainyDumpWeb do
    pipe_through(:browser)

    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
    post("/:provider/callback", AuthController, :callback)
  end

  scope "/", BrainyDumpWeb do
    pipe_through(:browser)

    get("/", StaticPageController, :index)
    get("/login_redirect/*wildcard", StaticPageController, :index)
    get("/app/*wildcard", StaticPageController, :index)
    get("/logout", AuthController, :logout)
  end

  scope "/api", BrainyDumpWeb do
    pipe_through([:api, :auth_api])

    resources("/posts", PostController, except: [:new, :edit])
    resources("/tags", TagController, except: [:new, :edit])
    resources("/users", UserController, except: [:new, :edit])
  end
end
