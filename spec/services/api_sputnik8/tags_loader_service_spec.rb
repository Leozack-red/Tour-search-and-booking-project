# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiSputnik8::TagsLoaderService do
  subject(:call) do
    described_class.call
  end

  let(:fake_client) { instance_double(Sputnik8::Client) }
  let(:activity) { create(:activity) }

  before do
    allow(Sputnik8::Client).to receive(:new).and_return(fake_client)
    allow(fake_client).to receive(:tags).and_return([{ 'sub_categories' => [{ 'short_name' => 'Музей', 'products' => [
                                                      {
                                                        'id' => 2694
                                                      }
                                                    ] }] }])
    allow(ApiSputnik8::TaggingsLoaderService).to receive(:call).and_return(nil)
    activity
  end

  context 'when client returns correct tag' do
    it 'adds new tag record with correct attributes', :aggregate_failures do
      call
      expect(Tag.count).to eq(1)
      expect(Tag.first).to have_attributes(name: 'Музей', weight: 0)
    end
  end

  context 'when client returns correct activities with the already added activity' do
    before { create(:tag) }

    it 'creates only correct activity' do
      expect { call }.not_to change(Tag, :count).from(1)
    end
  end
end
