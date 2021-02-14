class ControlPanel::VideosController < ControlPanel::BaseController
  before_action :set_video

  def show
  end

  def edit
  end

  def update
    if @video.update(video_params)
      flash[:notice] = "Updated Video Successfully"
      redirect_to control_panel_channel_path(@video.channel)
    else
      render :edit
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description)
  end
end
