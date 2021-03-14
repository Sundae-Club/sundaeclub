class NotificationSubscriptionsController < ApplicationController
  def create
    @notification_subscription = NotificationSubscription.create!(
      user: current_user,
      subscribeable_id: notification_subscription_params[:subscribeable_id],
      subscribeable_type: notification_subscription_params[:subscribeable_type],
      active: true
    )
    # binding.pry
    NewSubscriptionNotification.with(notification_subscription: @notification_subscription).deliver(current_user)
    # WebNotificationsChannel.broadcast_to(
    #   current_user,
    #   unread_notifications: current_user.notifications.unread.count
    # )
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'test_count',
          partial: 'notifications/notifications',
          locals: { notification_subscription: @notification_subscription }
        )
      end
      #format.turbo_stream
      # format.html { redirect_to messages_url }
    end
    # head :created# redirect_to channel_path(notification_subscription_params[:subscribeable_id])
  end

  def destroy
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
