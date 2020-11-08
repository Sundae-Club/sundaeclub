# frozen_string_literal: true

require 'rails_helper'

describe ControlPanel::ChannelsController, type: :controller do
  let(:channel) { FactoryBot.create(:channel) }

  context '#show' do
    context 'with a confirmed, signed-in user that belongs to the same organisation as the channel' do
      let(:user) { FactoryBot.create(:user, :confirmed) }
      let(:channel) { FactoryBot.create(:channel, organisation: user.organisation) }

      before { sign_in user }

      it 'should return a successful response' do
        get :show, params: { id: channel.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
