# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sputnik8::Client do
  describe '#activities' do
    subject(:response_test_activities) do
      described_class.new(Rails.application.credentials.api_key, Rails.application.credentials.username).activities
    end

    context 'when response with activities' do
      it 'has all fields if there is an response with activities', :vcr do
        expect(response_test_activities[0].keys).to include('id', 'title', 'description',
                                                            'image_big', 'price', 'customers_review_rating')
      end
    end
  end

  describe '#tags' do
    subject(:response_test_tags) do
      described_class.new(
        Rails.application.credentials.api_key,
        Rails.application.credentials.username
      ).tags(1)
    end

    context 'when response with tags' do
      it 'has all fields if there is an response with tags', :vcr do
        expect(response_test_tags[0]).to have_key('short_name')
      end
    end
  end

  describe '#cities' do
    subject(:response_test_cities) do
      described_class.new(Rails.application.credentials.api_key, Rails.application.credentials.username).cities(1)
    end

    context 'when response with cities' do
      it 'has all fields if there is an response with cities', :vcr do
        expect(response_test_cities.keys).to include('name', 'geo', 'providers')
      end
    end
  end
end
