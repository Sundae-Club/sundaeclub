# frozen_string_literal: true

require 'rails_helper'

describe ChannelsController, type: :controller do
  let(:channel) { FactoryBot.create(:channel) }

  context '#show' do
    it 'should return a successful response' do
      get :show, params: { id: channel.id }
      expect(response).to have_http_status(:ok)
    end
  end

  context '#edit' do
    before { get :edit, params: { id: channel.id } }

    it 'should return a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should assign a channel' do
      expect(assigns(:channel)).to eq channel
    end
  end

  context '#update' do
    let(:valid_params) do
      {
        name: 'Updated Name',
        description: 'Updated Description'
      }
    end

    before { patch :update, params: { id: channel.id, channel: valid_params } }

    it 'should update the channel' do
      expect(channel.reload.name).to eq 'Updated Name'
    end
  end
end
