# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiSputnik8::ActivitiesLoaderService do
  subject(:call) { described_class.call }

  let(:fake_client) { instance_double(Sputnik8::Client) }
  let(:city) { create(:city) }

  before do
    city
    allow(Sputnik8::Client).to receive(:new).and_return(fake_client)
    allow(fake_client).to receive(:activities).and_return([{ 'id' => 42,
                                                             'city_id' => city.id,
                                                             'title' => 'Экскурсия по Москве',
                                                             'description' => 'Sputnik8.com — это место',
                                                             'main_photo' =>
                                                             { 'big' => 'https://c7.ucarecdn.com/a7cad563' },
                                                             'price' => '750.00 руб.',
                                                             'customers_review_rating' => '6.6' }])
  end

  context 'when client returns correct activity' do
    it 'adds new activity record with correct attributes', :aggregate_failures do
      call
      expect(Activity.count).to eq(1)
      expect(Activity.first).to have_attributes(id: 42, city_id: city.id, title: 'Экскурсия по Москве',
                                                description: 'Sputnik8.com — это место', photo: 'https://c7.ucarecdn.com/a7cad563',
                                                price: '750.00 руб.', customers_review_rating: 6.6)
    end
  end

  context 'when client returns correct activities with the already added activity' do
    before { create(:activity, city: city, id: 42) }

    it 'creates only correct activity' do
      expect { call }.not_to change(Activity, :count).from(1)
    end
  end
end
