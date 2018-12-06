defmodule BrainyDumpWeb.User do
  use BrainyDumpWeb, :model

  @primary_key {:id, :string, []}
  @derive {Phoenix.Param, key: :id}
  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)

    has_many(:tags, BrainyDumpWeb.Tag)
    has_many(:posts, BrainyDumpWeb.Post)
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id, :first_name, :last_name, :email])
    |> validate_required([:id])
  end
end
