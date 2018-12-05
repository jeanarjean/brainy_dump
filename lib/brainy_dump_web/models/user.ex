defmodule BrainyDumpWeb.User do
  use BrainyDumpWeb, :model

  schema "users" do
    field(:auth_id, :string)

    timestamps()
  end

  def changeset(user, params, tags \\ nil)

  def changeset(user, params, nil) do
    user
    |> cast(params, ~w(auth_id), [])
  end
end
