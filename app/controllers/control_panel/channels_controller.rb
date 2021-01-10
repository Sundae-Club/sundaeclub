class ControlPanel::ChannelsController < ControlPanel::BaseController
  before_action :set_channel

  def show
    authorize @channel
    @videos = @channel.videos.order("updated_at desc")
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
