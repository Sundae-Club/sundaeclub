class ControlPanel::ChannelsController < ControlPanel::BaseController
  before_action :set_channel

  def show
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
