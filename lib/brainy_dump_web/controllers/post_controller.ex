defmodule BrainyDumpWeb.PostController do
  use BrainyDumpWeb, :controller

  action_fallback(BrainyDumpWeb.FallbackController)

  alias BrainyDump.Repo
  alias BrainyDumpWeb.Post
  alias BrainyDumpWeb.Tag
  import Ecto.Query, only: [from: 2]
  import Logger

  def index(conn, _params) do
    posts =
      Repo.all(Post)
      |> Enum.map(fn post -> Repo.preload(post, :tags) end)

    render(conn, "index.json", posts: posts)
  end

  def create(conn, post_params) do
    # Legacy code, we now use tags name to find one
    # tags =
    #   post_params["tags"]
    #   |> Enum.map(fn tag ->
    #     Repo.one(
    #       from(
    #         t in Tag,
    #         where: t.id == ^tag["id"]
    #       )
    #     )
    #   end)

    tag_list = String.split(post_params["tags"], " ")

    tags =
      tag_list
      |> Enum.map(fn tag ->
        Repo.one(
          from(
            t in Tag,
            where: t.name == ^tag
          )
        )
      end)
    Logger.warn(inspect tags)

    post = Post.changeset(%Post{}, post_params, tags)

    if post.valid? do
      {:ok, post} = Repo.insert(post)

      post = Repo.preload(post, :tags)

      conn
      |> put_status(:created)
      |> put_resp_header("location", post_path(conn, :show, post))
      |> render("show.json", post: post)
    else
      Logger.warn("Allo")

      #TODO fix this
      conn
      |> put_status(:created)
      |> put_resp_header("location", post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def show(conn, %{"id" => id}) do
    post =
      Repo.one(
        from(
          t in Post,
          where: t.id == ^id,
          left_join: tags in assoc(t, :tags),
          preload: [tags: tags]
        )
      )

    render(conn, "show.json", post: post)
  end
end
