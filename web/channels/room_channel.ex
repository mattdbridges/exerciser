defmodule Exerciser.RoomChannel do
  use Exerciser.Web, :channel

  def join("rooms:lobby", payload, socket) do
    {:ok, socket}
  end

  def join("rooms:" <> _private_room_id, _auth_msg, socket) do
    {:error, %{reason: "unauthorized"}}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (rooms:lobby).
  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end

end
