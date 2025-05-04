class NotificationsController < ApplicationController
  before_action :require_login

  def index
    @notifications = Notification.where("visitor_id = ? OR visited_id = ?", current_user.id, current_user.id)
                               .includes(:visitor, :visited, :practice_match)
                               .order(created_at: :desc)
    @notifications.update_all(checked: true)
  end
end
