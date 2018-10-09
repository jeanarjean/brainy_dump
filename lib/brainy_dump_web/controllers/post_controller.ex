defmodule BrainyDumpWeb.PostController do
  use BrainyDumpWeb, :controller

  action_fallback(BrainyDumpWeb.FallbackController)

  alias BrainyDump.Repo
  alias BrainyDumpWeb.Post
  alias BrainyDumpWeb.Tag
  alias BrainyDumpWeb.PostTag
  import Ecto.Query, only: [from: 2]
  import Logger
  plug(Ueberauth)

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
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

    Logger.warn(inspect(tags))
    Logger.warn(inspect(get_session(conn, :current_user)))

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

      # TODO fix this
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

    render(conn, "post_complete.json", post: post)
  end

  def update(conn, post_params) do
    post =
      Repo.one(
        from(
          p in Post,
          where: p.id == ^post_params["id"],
          left_join: tags in assoc(p, :tags),
          preload: [tags: tags]
        )
      )

    post = Post.changeset(post, post_params)

    if post.valid? do
      {:ok, post} = Repo.update(post)

      post = Repo.preload(post, :tags)

      conn
      |> put_status(:ok)
      |> put_resp_header("location", post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    case Repo.delete(post) do
      {:ok, _something} -> json(conn, %{message: "I win"})
      {:error, _changeset} -> json(conn, %{message: "I died"})
    end
  end
end
