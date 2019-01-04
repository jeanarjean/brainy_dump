defmodule BrainyDumpWeb.Tag do
  use BrainyDumpWeb, :model

  schema "tags" do
    field(:name, :string)

    many_to_many(:posts, BrainyDumpWeb.Post, join_through: "posts_tags")
    belongs_to(:user, BrainyDumpWeb.User, type: :string)

    belongs_to(:parent, BrainyDumpWeb.Tag)
    has_many(:children, BrainyDumpWeb.Tag, foreign_key: :parent_id)

    timestamps()
  end

  def changeset(tag, params, data \\ nil, user \\ nil)

  def changeset(tag, params, nil, user) do
    tag
    |> cast(params, ~w(name)a, [])
    |> put_assoc(:user, user)
    |> validate_length(:name, max: 60)
    |> validate_required(:user)
  end

  def changeset(tag, params = %{parent: parent}, nil, user) do
    tag
    |> cast(params, ~w(name)a, [])
    |> put_assoc(:user, user)
    |> put_assoc(:parent, parent)
    |> validate_length(:name, max: 60)
    |> validate_required(:user)
  end
end
