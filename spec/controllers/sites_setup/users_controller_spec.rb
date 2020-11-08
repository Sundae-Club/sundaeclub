# frozen_string_literal: true

require 'rails_helper'

describe SitesSetup::UsersController, type: :controller do
  describe '#new' do
    context 'with a valid site' do
      let(:site) { FactoryBot.create(:site) }

      it 'should return a success response' do
        get :new, params: { site_id: site.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#create' do
    context 'with a valid site' do
      let(:site) { FactoryBot.create(:site) }

      context 'with valid params' do
        let(:valid_params) do
          {
            email: 'example@example.com',
            password: 'eu392nr;i39'
          }
        end
        let(:create_action) do
          post :create, params: { site_id: site.id, user: valid_params }
        end

        it 'should create a new user associated with the sites organisation' do
          expect { create_action }
            .to change { User.where(organisation: site.organisation).count }.by(1)
        end
      end
    end
  end
end
