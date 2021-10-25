# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityPresenter do
  subject(:instance) { described_class.new({ id: 1 }) }

  let(:activity) { instance.activity }

  before { create(:activity) }

  context 'when Activity.pluck return correct activities' do
    it 'return the correct activity' do
      expect(activity).to have_attributes(title: 'Обзорная экскурсия по Москве',
                                          description: 'Sputnik8.com — это место',
                                          photo: 'https://c7.ucarecdn.com/a7cad563',
                                          price: '750.00 руб.')
    end
  end
end
