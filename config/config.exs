# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :brainy_dump,
  ecto_repos: [BrainyDump.Repo]

# Configures the endpoint
config :brainy_dump, BrainyDumpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5z5s66hs3TUf47C4WaOYZwX5yzpj3C/RjZlOgxRifQTpY8IkZF4jNscSFTrwM9+G",
  render_errors: [view: BrainyDumpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BrainyDump.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# # Configures Ueberauth's Auth0 auth provider
# config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
#   domain: System.get_env("AUTH0_DOMAIN"),
#   client_id: System.get_env("AUTH0_CLIENT_ID"),
#   client_secret: System.get_env("AUTH0_CLIENT_SECRET")

config :brainy_dump, BrainyDump.Guardian,
  issuer: "brainy_dump",
  secret_key: System.get_env("GUARDIAN_SECRET")

config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
  ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: System.get_env("AUTH0_DOMAIN"),
  client_id: System.get_env("AUTH0_CLIENT_ID"),
  client_secret: System.get_env("AUTH0_CLIENT_SECRET")
