class ControlPanel::Channels::SuspensionsController < ControlPanel::BaseController
  before_action :set_channel

  def create
    @channel.update(suspended_at: Time.zone.now)
    flash['notice'] = "#{@channel.name} has been suspended."
    redirect_to control_panel_channel_path(@channel)
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
