# frozen_string_literal: true

require 'rails_helper'

describe ControlPanel::Channels::SuspensionsController, type: :controller do
  let(:channel) { FactoryBot.create(:channel) }

  context '#create' do
    it 'should suspend the channel' do
      post :create, params: { channel_id: channel.id }
      expect(channel.reload.suspended_at).to_not be_nil
    end
  end
end
