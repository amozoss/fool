defmodule Fool.Signups.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :description, :string
    field :title, :string
    field :html, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :description, :html])
    |> validate_required([:title, :description])
  end
end
