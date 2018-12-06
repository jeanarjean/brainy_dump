defmodule BrainyDump.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :string, primary_key: true)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:email, :string)

      timestamps()
    end

    alter table(:tags) do
      add(:user_id, references(:users, type: :string))
    end

    alter table(:posts) do
      add(:user_id, references(:users, type: :string))
    end
  end
end
