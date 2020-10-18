class ControlPanel::ChannelsController < ControlPanel::BaseController
  before_action :set_channel

  def show
    authorize @channel
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
