defmodule BrainyDumpWeb.PageView do
  use BrainyDumpWeb, :view

  alias BrainyDumpWeb.TopicView
  require Logger

  def render("index.json", %{topics: topics}) do
    render_many(topics, TopicView, "topic.json")
  end

  def render("show.json", %{topic: topic}) do
    render_one(topic, TopicView, "topic.json")
  end

  def render("topic.json", %{topic: topic}) do
    %{
      id: topic.id,
      title: topic.title,
      body: topic.body,
      parents: format_id_list(topic.parents),
      child: format_id_list(topic.child)
    }
  end

  defp format_id_list(list) do
    Enum.map(list, fn struct -> struct.id end)
  end
end
