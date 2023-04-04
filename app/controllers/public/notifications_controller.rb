class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!, only: [:index, :update]

  def index
    @notifications = current_member.passive_notifications#Notification.where(visited_id: current_member.id)
    # @notifications = current_member.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  def update
    notification = Notification.find(params[:id])
    if notification.update(checked: true)
      redirect_to notifications_path
    end
  end

end
