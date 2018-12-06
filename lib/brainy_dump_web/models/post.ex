defmodule BrainyDumpWeb.Post do
  use BrainyDumpWeb, :model

  schema "posts" do
    field(:title, :string)
    field(:body, :string)

    many_to_many(:tags, BrainyDumpWeb.Tag, join_through: "posts_tags")
    belongs_to(:user, BrainyDumpWeb.User, type: :string)

    timestamps()
  end

  def changeset(post, params, tags \\ nil, user)

  def changeset(post, params, nil, nil) do
    post
    |> cast(params, ~w(title body)a, [])
    |> validate_length(:title, max: 60)
    |> validate_required(:user)
  end

  def changeset(post, params, nil, user) do
    post
    |> cast(params, ~w(title body)a, [])
    |> put_assoc(:user, user)
    |> validate_length(:title, max: 60)
    |> validate_required(:user)
  end

  def changeset(post, params, tags, user) do
    post
    |> cast(params, ~w(title body)a, [])
    |> put_assoc(:tags, tags)
    |> put_assoc(:user, user)
    |> validate_length(:title, max: 60)
    |> validate_required(:user)
  end
end
