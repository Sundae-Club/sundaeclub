class PopulateChannelVideosJob < ApplicationJob
  queue_as :default

  def perform(channel:)
    raise "Can't populate Channel without valid YouTube channel ID" unless channel.youtube_channel_id

    YoutubeService::ImportChannelVideos.new(channel: channel).call
  end
end
