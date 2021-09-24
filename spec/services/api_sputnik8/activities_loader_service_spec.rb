# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiSputnik8::ActivitiesLoaderService do
  subject(:call) do
    described_class.call
  end

  let(:fake_client) { instance_double(Sputnik8::Client) }
  let(:city) { create(:city) }
  let(:activity) { create(:activity) }

  before do
    allow(Sputnik8::Client).to receive(:new).and_return(fake_client)
    allow(fake_client).to receive(:activities).and_return([{ city_id: city.id,
                                                             title: 'Обзорная автобусная экскурсия по Москве',
                                                             description: 'Sputnik8.com — это место',
                                                             main_photo: { small: 'https://c7.ucarecdn.com/a7cad563' },
                                                             price: '750.00 руб.',
                                                             customers_review_rating: '6.6' }])
  end

  describe '.call' do
    context 'when client returns correct activity' do
      it 'adds new activity record with correct attributes', :aggregate_failures do
        call
        expect(Activity.count).to eq(1)
        expect(Activity.first).to have_attributes(city_id: city.id, title: 'Обзорная автобусная экскурсия по Москве',
                                                  description: 'Sputnik8.com — это место', photo: 'https://c7.ucarecdn.com/a7cad563',
                                                  price: '750.00 руб.', customers_review_rating: 6.6)
      end
    end

    context 'when client returns correct activities with the already added activity' do
      it 'creates only correct activity' do
        activity
        call
        expect { Activity.count }.not_to change(Activity, :count).from(1)
      end
    end
  end
end