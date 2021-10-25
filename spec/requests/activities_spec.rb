# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  describe 'GET /activities' do
    it 'returns http success' do
      get '/activities'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
