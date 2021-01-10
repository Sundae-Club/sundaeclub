require 'rails_helper'

RSpec.describe PopulateChannelVideosJob, type: :job do
  let(:channel) { instance_double(Channel, :channel, youtube_channel_id: youtube_channel_id) }
  let(:youtube_channel_id) { 'youtube_id' }

  context 'with a Channel' do
    context 'with a valid YouTube channel ID' do
      let(:youtube_service) { instance_double("YoutubeService::ImportChannelVideos", call: nil) }

      before do
        allow(YoutubeService::ImportChannelVideos)
          .to receive(:new).with(channel: channel)
          .and_return(youtube_service)
      end

      it 'should populate the Channel with videos' do
        expect(youtube_service).to receive(:call)
        subject.perform(channel: channel)
      end
    end

    context 'without a valid YouTube channel ID' do
      let(:youtube_channel_id) { nil }

      it 'should raise an exception' do
        expect { subject.perform(channel: channel) }
          .to raise_error("Can't populate Channel without valid YouTube channel ID")
      end
    end
  end
end
