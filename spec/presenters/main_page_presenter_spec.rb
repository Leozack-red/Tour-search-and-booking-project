# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainPagePresenter do
  subject(:instance) { described_class.new }

  let(:number_records) { 3 }

  before do
    create_list(:activity, number_records, description: 'Москва - это место. Питер - это тоже место.')
  end

  describe '#pagination' do
    let(:pagination) { instance.pagination }

    context 'when have a Activity model with records' do
      it 'return a paginator and a collections with correct attributes' do
        expect(pagination[0]).to have_attributes(title: 'Обзорная экскурсия по Москве',
                                                 description: 'Москва - это место. Питер - это тоже место.',
                                                 photo: 'https://c7.ucarecdn.com/a7cad563',
                                                 price: '750.00 руб.')
      end

      it 'return a paginator and a collections with correct count' do
        expect(pagination.size).to eq(3)
      end
    end
  end

  describe '#cities_names' do
    let(:cities_names) { instance.cities_names }

    context 'when City.pluck return correct activities' do
      let(:number_records) { 1 }

      it 'return the correct data of name of cities' do
        expect(cities_names).to eq(['Ахен'])
      end
    end
  end
end
