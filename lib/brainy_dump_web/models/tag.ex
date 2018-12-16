defmodule BrainyDumpWeb.Tag do
  use BrainyDumpWeb, :model

  schema "tags" do
    field(:name, :string)

    many_to_many(:posts, BrainyDumpWeb.Post, join_through: "posts_tags")
    belongs_to(:user, BrainyDumpWeb.User, type: :string)

    timestamps()
  end

  def changeset(tag, params, posts \\ nil, user \\ nil)

  def changeset(tag, params, nil, nil) do
    tag
    |> cast(params, ~w(name)a, [])
    |> validate_length(:name, max: 60)
    |> validate_required(:user)
  end

  def changeset(tag, params, nil, user) do
    tag
    |> cast(params, ~w(name)a, [])
    |> put_assoc(:user, user)
    |> validate_length(:name, max: 60)
    |> validate_required(:user)
  end

  def changeset(tag, params, posts, nil) do
    tag
    |> cast(params, ~w(name)a, [])
    |> put_assoc(:posts, posts)
    |> validate_length(:name, max: 60)
    |> validate_required(:user)
  end

  def changeset(tag, params, posts, user) do
    tag
    |> cast(params, ~w(name)a, [])
    |> put_assoc(:posts, posts)
    |> put_assoc(:user, user)
    |> validate_length(:name, max: 60)
    |> validate_required(:user)
  end
end
