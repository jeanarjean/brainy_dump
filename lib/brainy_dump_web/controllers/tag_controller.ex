defmodule BrainyDumpWeb.TagController do
  use BrainyDumpWeb, :controller

  action_fallback(BrainyDumpWeb.FallbackController)

  alias BrainyDump.Repo
  alias BrainyDumpWeb.Tag
  alias BrainyDumpWeb.Post
  import Ecto.Query, only: [from: 2]

  # plug(BrainyDumpWeb.Plugs.Ueberauth)

  def index(conn, _params) do
    tags =
      Repo.all(Tag)
      |> Enum.map(fn tag -> Repo.preload(tag, :posts) end)

    render(conn, "index.json", tags: tags)
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

  def create(conn, tag_params)

  def create(conn, tag_params = %{"posts" => posts}) do
    posts =
      posts
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

  def create(conn, tag_params) do
    tag = Tag.changeset(%Tag{}, tag_params)

    if tag.valid? do
      {:ok, tag} = Repo.insert(tag)

      tag = Repo.preload(tag, :posts)

      conn
      |> put_status(:created)
      |> put_resp_header("location", tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def update(conn, tag_params) do
    tag =
      Repo.one(
        from(
          t in Tag,
          where: t.id == ^tag_params["id"],
          left_join: posts in assoc(t, :posts),
          preload: [posts: posts]
        )
      )

    tag = Tag.changeset(tag, tag_params)

    if tag.valid? do
      {:ok, tag} = Repo.update(tag)

      tag = Repo.preload(tag, :posts)

      conn
      |> put_status(:ok)
      |> put_resp_header("location", tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Repo.get!(Tag, id)

    case Repo.delete(tag) do
      {:ok, _something} -> json(conn, %{message: "I win"})
      {:error, _changeset} -> json(conn, %{message: "I died"})
    end
  end
end
