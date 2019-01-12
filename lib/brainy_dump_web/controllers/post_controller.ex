defmodule BrainyDumpWeb.PostController do
  use BrainyDumpWeb, :controller

  action_fallback(BrainyDumpWeb.FallbackController)

  alias BrainyDump.Repo
  alias BrainyDumpWeb.Post
  alias BrainyDumpWeb.Tag
  alias BrainyDumpWeb.User

  import Ecto.Query, only: [from: 2]
  import Ecto
  import Logger

  def action(conn, _) do
    user_id = BrainyDump.Guardian.Plug.current_claims(conn)["sub"]
    current_user = Repo.get!(User, user_id)
    params = for {key, val} <- conn.params, into: %{}, do: {String.to_atom(key), val}
    apply(__MODULE__, action_name(conn), [conn, params, current_user])
  end

  def index(conn, _params, current_user) do
    posts =
      Repo.all(user_posts(current_user))
      |> Enum.map(fn post -> Repo.preload(post, :tags) end)

    render(conn, "index.json", posts: posts)
  end

  def show(conn, %{id: id}, current_user) do
    post =
      Repo.one(
        from(
          t in user_posts(current_user),
          where: t.id == ^id,
          left_join: tags in assoc(t, :tags),
          preload: [tags: tags]
        )
      )

    render(conn, "post_complete.json", post: post)
  end

  def create(conn, post_params, current_user) do
    tag_list = post_params[:tags]

    tags =
      tag_list
      |> Enum.map(fn tag ->
        Repo.one(
          from(
            t in user_tags(current_user),
            where: t.id == ^tag["id"]
          )
        )
      end)

    post = Post.changeset(%Post{}, post_params, tags, current_user)

    if post.valid? do
      {:ok, post} = Repo.insert(post)

      post = Repo.preload(post, :tags)

      conn
      |> put_status(:created)
      |> put_resp_header("location", post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def update(conn, post_params, current_user) do
    post =
      Repo.one(
        from(
          p in user_posts(current_user),
          where: p.id == ^post_params[:id],
          left_join: tags in assoc(p, :tags),
          left_join: user in assoc(p, :user),
          preload: [tags: tags, user: user]
        )
      )

    post = Post.changeset(post, post_params, nil, nil)

    if post.valid? do
      {:ok, post} = Repo.update(post)

      post = Repo.preload(post, :tags)

      conn
      |> put_status(:ok)
      |> put_resp_header("location", post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def delete(conn, %{id: id}, current_user) do
    post = Repo.get!(user_posts(current_user), id)

    case Repo.delete(post) do
      {:ok, _something} -> json(conn, %{message: "I win"})
      {:error, _changeset} -> json(conn, %{message: "I died"})
    end
  end

  defp user_tags(current_user) do
    assoc(current_user, :tags)
  end

  defp user_posts(current_user) do
    assoc(current_user, :posts)
  end
end
