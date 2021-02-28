class NotificationSubscriptionsController < ApplicationController
  def create
    NotificationSubscription.create!(
      user: current_user,
      subscribeable_id: notification_subscription_params[:subscribeable_id],
      subscribeable_type: notification_subscription_params[:subscribeable_type],
      active: true
    )
    redirect_to channel_path(notification_subscription_params[:subscribeable_id])
  end

  def destroy
    # binding.pry
    @notification_instance = NotificationSubscription.find_by(
      user: current_user,
      subscribeable_id: notification_subscription_params[:subscribeable_id],
      subscribeable_type: notification_subscription_params[:subscribeable_type],
      active: true
    )
    @notification_instance.destroy
    redirect_to channel_path(notification_subscription_params[:subscribeable_id])
  end

  private

  def notification_subscription_params
    params.permit(:subscribeable_id, :subscribeable_type)
  end
end
