# frozen_string_literal: true

require 'rails_helper'

describe ControlPanel::ChannelsController, type: :controller do
  context '#show' do
    context 'with a confirmed, signed-in user that belongs to the same organisation as the channel' do
      let(:user) { FactoryBot.create(:user, :confirmed) }
      let!(:site) { FactoryBot.create(:site, organisation: user.organisation) }
      let(:channel) { FactoryBot.create(:channel, site: site) }

      before { sign_in user }

      it 'should return a successful response' do
        get :show, params: { id: channel.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
