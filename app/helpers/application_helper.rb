module ApplicationHelper
  def room_channel(room)
    "/room/#{room.id}"
  end
end
