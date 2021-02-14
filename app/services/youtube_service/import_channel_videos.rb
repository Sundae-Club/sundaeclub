class YoutubeService::ImportChannelVideos
  def initialize(channel:)
    @channel = channel
    @response = ServiceResponse.new
  end

  def call
    import_videos
    @response.return
  end

  private

  def import_videos
    youtube_channel = Yt::Channel.new(id: @channel.youtube_channel_id)
    youtube_channel.videos.each do |youtube_video|
      next if Video.where(channel_id: @channel.id, external_id: youtube_video.id).any?

      video = Yt::Video.new(id: youtube_video.id)

      @channel.videos.create!(
        external_id: youtube_video.id,
        title: youtube_video.title,
        description: video.description,
        thumbnail_url: youtube_video.thumbnail_url
      )
    end
  end
end
