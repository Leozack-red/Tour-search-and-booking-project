# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /cities' do
    it 'returns http success' do
      get '/cities'
      expect(response).to have_http_status(:success)
    end
  end
end
