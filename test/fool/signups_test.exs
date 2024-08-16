defmodule Fool.SignupsTest do
  use Fool.DataCase

  alias Fool.Signups

  describe "pages" do
    alias Fool.Signups.Page

    import Fool.SignupsFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Signups.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Signups.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Page{} = page} = Signups.create_page(valid_attrs)
      assert page.description == "some description"
      assert page.title == "some title"
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Signups.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Page{} = page} = Signups.update_page(page, update_attrs)
      assert page.description == "some updated description"
      assert page.title == "some updated title"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Signups.update_page(page, @invalid_attrs)
      assert page == Signups.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Signups.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Signups.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Signups.change_page(page)
    end
  end
end
