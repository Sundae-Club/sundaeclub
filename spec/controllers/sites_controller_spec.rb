# frozen_string_literal: true

require 'rails_helper'

describe SitesController, type: :controller do
  context '#create' do
    context 'as a non-logged-in visitor' do
      let(:create_action) do
        post :create, params: { site: { name: 'TestName' } }
      end

      it 'should create a valid site' do
        expect { create_action }.to change { Site.count }.by(1)
      end
    end
  end
end
