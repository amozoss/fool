defmodule Fool.Repo.Migrations.AddHtmlToPage do
  use Ecto.Migration

  def change do
    alter table(:pages) do
      add :html, :text
    end
  end
end
