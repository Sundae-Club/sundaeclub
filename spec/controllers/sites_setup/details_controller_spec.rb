# frozen_string_literal: true

require 'rails_helper'

describe SitesSetup::DetailsController, type: :controller do
  let(:site) { FactoryBot.create(:site) }

  describe '#edit' do
    context 'with a valid site' do
      let(:edit_action) { get :edit, params: { site_id: site.id } }

      it 'should assign a new channel' do
        edit_action
        expect(assigns(:channel)).to be_a_new(Channel)
      end

      it 'should return a success response' do
        edit_action
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#update' do
    context 'with valid params' do
      let(:valid_params) do
        {
          site_id: site.id,
          channel: {
            youtube_channel_id: 'example_id'
          }
        }
      end
      let(:update_action) do
        patch :update, params: valid_params
      end

      it 'creates a new channel for the site' do
        expect { update_action }.to change { site.channels.count }.by(1)
      end
    end
  end
end
