defmodule BrainyDump.Plugs.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :brainy_dump,
    module: BrainyDump.Guardian,
    error_handler: BrainyDump.AuthErrorHandler

  plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
