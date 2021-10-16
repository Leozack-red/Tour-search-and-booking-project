# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CityPresenter do
  subject(:instance) { described_class.new(city) }

  let(:city) { create(:city, id: 1) }

  describe '#pagination' do
    subject(:pagination) { instance.pagination }

    before do
      city
      create_list(:activity, 3, city_id: 1)
    end

    it 'return correct count of activities pagination for one city' do
      expect(pagination.count).to eq(3)
    end
  end
end
