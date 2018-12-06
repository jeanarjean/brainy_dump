defmodule BrainyDumpWeb.UserView do
  use BrainyDumpWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, BrainyDump.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, BrainyDump.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
    }
  end
end
