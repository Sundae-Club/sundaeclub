class AddYouTubeChannelIdToChannels < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :youtube_channel_id, :text
  end
end
