# frozen_string_literal: true

class SitesSetup::DetailsController < SitesSetup::BaseController
  def edit
    @channel = Channel.new(site: @site)
  end

  def update
    @channel = Channel.new(site: @site)
    @channel.assign_attributes(channel_params)
    if @channel.save
      PopulateChannelVideosJob.set(wait: 30.seconds).perform_later(channel: @channel)
      redirect_to new_sites_setup_users_path(@site)
    else
      render :edit
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:youtube_channel_id)
  end
end
