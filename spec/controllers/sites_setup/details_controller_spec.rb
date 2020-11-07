# frozen_string_literal: true

require 'rails_helper'

describe SitesSetup::DetailsController, type: :controller do
  describe '#edit' do
    context 'with a valid site' do
      let(:site) { FactoryBot.create(:site) }

      it 'should return a success response' do
        get :edit, params: { site_id: site.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
