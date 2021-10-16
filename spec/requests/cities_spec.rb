# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'City', type: :request do
  before { create(:city) }

  context 'when request GET /cities/1' do
    it 'returns http 200' do
      get '/cities/1'
      expect(response).to have_http_status(:success)
    end
  end

  context 'when request GET /cities/5' do
    it 'return record not found' do
      expect { get '/cities/5' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
