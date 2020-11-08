# frozen_string_literal: true

require 'rails_helper'

describe ControlPanel::Channels::SuspensionsController, type: :controller do
  let(:channel) { FactoryBot.create(:channel) }

  context '#create' do
    context 'with a confirmed, signed-in user' do
      before { sign_in FactoryBot.create(:user, :confirmed) }

      it 'should suspend the channel' do
        post :create, params: { channel_id: channel.id }
        expect(channel.reload.suspended_at).to_not be_nil
      end
    end
  end
end
