defmodule Fool.SignupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fool.Signups` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Fool.Signups.create_page()

    page
  end
end
