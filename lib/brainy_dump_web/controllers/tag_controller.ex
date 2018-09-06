defmodule BrainyDumpWeb.TagController do
  use BrainyDumpWeb, :controller

  action_fallback(BrainyDumpWeb.FallbackController)

  alias BrainyDump.Repo
  alias BrainyDumpWeb.Tag
  alias BrainyDumpWeb.Post
  import Ecto.Query, only: [from: 2]

  def index(conn, _params) do
    tags =
      Repo.all(Tag)
      |> Enum.map(fn tag -> Repo.preload(tag, :posts) end)

    render(conn, "index.json", tags: tags)
  end

  def create(conn, tag_params) do

    posts =
      tag_params["posts"]
      |> Enum.map(fn post ->
        Repo.one(
          from(
            p in Post,
            where: p.id == ^post["id"]
          )
        )
      end)

    tag = Tag.changeset(%Tag{}, tag_params, posts)

    if tag.valid? do
      {:ok, tag} = Repo.insert(tag)

      tag = Repo.preload(tag, :posts)

      conn
      |> put_status(:created)
      |> put_resp_header("location", tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag =
      Repo.one(
        from(
          t in Tag,
          where: t.id == ^id,
          left_join: posts in assoc(t, :posts),
          preload: [posts: posts]
        )
      )

    render(conn, "show.json", tag: tag)
  end
end
