module ApplicationHelper

  def room_channel(room)
    "/room/#{room.id}"
  end

  # Creates unique id for HTML document body used for unobtrusive javascript selectors
  def body_id
    parts = controller.controller_path.split('/')
    parts << controller.action_name
    parts.join('_')
  end
end
