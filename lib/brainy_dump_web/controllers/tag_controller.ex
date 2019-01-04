defmodule BrainyDumpWeb.TagController do
  use BrainyDumpWeb, :controller

  action_fallback(BrainyDumpWeb.FallbackController)

  alias BrainyDump.Repo
  alias BrainyDumpWeb.Tag
  alias BrainyDumpWeb.Post
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
    tags =
      Repo.all(user_tags(current_user))
      |> Enum.map(fn tag ->
        tag
        |> Repo.preload(:posts)
        |> Repo.preload(:parent)
      end)

    render(conn, "index.json", tags: tags)
  end

  def show(conn, %{id: id}, current_user) do
    tag =
      Repo.one(
        from(
          t in user_tags(current_user),
          where: t.id == ^id,
          left_join: posts in assoc(t, :posts),
          preload: [posts: posts]
        )
      )

    tag =
      tag
      |> Repo.preload(:parent)

    render(conn, "show.json", tag: tag)
  end

  def create(conn, tag_params, current_user)

  def create(conn, tag_params, current_user) do
    tag = Tag.changeset(%Tag{}, tag_params, nil, current_user)

    if tag.valid? do
      {:ok, tag} = Repo.insert(tag)

      tag = Repo.preload(tag, :posts)

      conn
      |> put_status(:created)
      |> put_resp_header("location", tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def update(conn, tag_params, current_user) do
    tag =
      Repo.one(
        from(
          t in Tag,
          where: t.id == ^tag_params[:id],
          left_join: posts in assoc(t, :posts),
          left_join: user in assoc(t, :user),
          preload: [posts: posts, user: user]
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

  def delete(conn, %{id: id}, current_user) do
    tag = Repo.get!(Tag, id)

    case Repo.delete(tag) do
      {:ok, _something} -> json(conn, %{message: "I win"})
      {:error, _changeset} -> json(conn, %{message: "I died"})
    end
  end

  defp user_tags(user) do
    assoc(user, :tags)
  end

  defp user_posts(user) do
    assoc(user, :posts)
  end
end
