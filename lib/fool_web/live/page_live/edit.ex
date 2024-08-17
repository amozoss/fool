defmodule FoolWeb.PageLive.Edit do
  use FoolWeb, :live_view

  alias Fool.Signups
  alias Fool.Signups.Page

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def render(assigns) do
    IO.inspect(self(), label: "edit")

    ~H"""
    <div>
      <div phx-update="ignore" id="wrapper">
        <div id="novel-editor" phx-hook="Novel"></div>
      </div>
      <.back navigate={~p"/pages"}>Back to pages</.back>
    </div>
    """
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Page")
    |> assign(:page, Signups.get_page!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Page")
    |> assign(:page, %Page{})
  end

  defp page_title(:edit), do: "Edit Page"
  defp page_title(:new), do: "New Page"
end
