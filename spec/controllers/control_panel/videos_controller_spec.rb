require 'rails_helper'

describe ControlPanel::VideosController, type: :controller do
  let(:user) { FactoryBot.create(:user, :confirmed) }
  let!(:site) { FactoryBot.create(:site, organisation: user.organisation) }
  let(:channel) { FactoryBot.create(:channel, site: site) }
  let(:video) { FactoryBot.create(:video, channel: channel) }

  before { sign_in user }

  context '#edit' do
    it 'should return a success response' do
      get :edit, params: { id: video.id }

      expect(response).to have_http_status(:ok)
    end
  end

  context '#update' do
    context 'with valid params' do
      let(:valid_params) do
        {
          title: 'UpdatedTitle',
          description: 'UpdatedDescription'
        }
      end

      it 'should update the video' do
        patch :update, params: { id: video.id, video: valid_params }

        video.reload

        expect(video.title).to eq 'UpdatedTitle'
        expect(video.description).to eq 'UpdatedDescription'
      end
    end
  end
end
