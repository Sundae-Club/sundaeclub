# frozen_string_literal: true

require 'rails_helper'

describe StaticController, type: :controller do
  context '#home_page' do
    it 'should return a successful response' do
      get :home_page
      expect(response).to have_http_status(:ok)
    end
  end
end
