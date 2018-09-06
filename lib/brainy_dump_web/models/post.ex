defmodule BrainyDumpWeb.Post do
  use BrainyDumpWeb, :model

  schema "posts" do
    field(:title, :string)
    field(:body, :string)

    many_to_many(:tags, BrainyDumpWeb.Tag, join_through: "posts_tags")

    timestamps()
  end

  def changeset(post, params, tags \\ nil)
  def changeset(post, params, nil) do
    post
    |> cast(params, ~w(title body), [])
  end
  def changeset(post, params, tags) do
    post
    |> cast(params, ~w(title body), [])
    |> put_assoc(:tags, tags)
  end
end
