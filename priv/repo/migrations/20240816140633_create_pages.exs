defmodule Fool.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
