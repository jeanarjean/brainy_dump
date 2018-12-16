defmodule BrainyDump.Repo do
  use Ecto.Repo,
    otp_app: :brainy_dump,
    adapter: Ecto.Adapters.Postgres,
    url: "localhost",
    username: "swag"

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  # def init(_, opts) do
  #   {:ok, Keyword.put(opts, :username, System.get_env("POSTGRES_USERNAME"))}
  # end
end
