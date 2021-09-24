# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiSputnik8::CitiesLoaderService do
  subject(:call) do
    described_class.call(1)
  end

  let(:fake_client) { instance_double(Sputnik8::Client) }
  let(:city) { create(:city) }

  before do
    allow(Sputnik8::Client).to receive(:new).and_return(fake_client)
    allow(fake_client).to receive(:cities).and_return([{ id: 42, region_id: 42, country_id: 10, name: 'Ахен' }])
    allow(fake_client).to receive(:city).with(42).and_return({ 'name' => 'Ахен',
                                                               'providers' => 9,
                                                               'geo' => { 'description' => { 'image' =>
                                                               'https://7d9e88a8.net' } } })
    city
  end

  describe '.call' do
    context 'when client returns correct city' do
      let(:city) { nil }

      it 'adds new city with correct attributes', :aggregate_failures do
        call
        expect(City.count).to eq(1)
        expect(City.last).to have_attributes(name: 'Ахен', photo: 'https://7d9e88a8.net', weight: 9)
      end
    end

    context 'when client returns correct city with the already added city' do
      it 'creates only correct city' do
        call
        expect { City.count }.not_to change(City, :count).from(1)
      end
    end
  end
end
