defmodule FoolWeb.PageLive.Show do
  use FoolWeb, :live_view

  alias Fool.Signups

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:page, Signups.get_page!(id))}
  end

  defp page_title(:show), do: "Show Page"
end
