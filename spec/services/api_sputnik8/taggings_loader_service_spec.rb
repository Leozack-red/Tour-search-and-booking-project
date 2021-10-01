# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiSputnik8::TaggingsLoaderService do
  subject(:call) do
    described_class.call([10, 666], 5)
  end

  let(:activity1) { create(:activity, id: 10) }
  let(:activity2) { create(:activity, id: 666) }

  before do
    activity1
    activity2
    create(:tag, id: 5)
  end

  context 'when tags loader and activity loader return correct tag and activities' do
    it 'creates new taggings for provided tag and activities', :aggregate_failures do
      call
      expect(Tagging.count).to eq(2)
      expect(Tagging.first).to have_attributes(activity_id: 10, tag_id: 5)
      expect(Tagging.last).to have_attributes(activity_id: 666, tag_id: 5)
    end
  end

  context 'when tag doesnt have a activity' do
    let(:activity1) { nil }

    it 'create correct tagging and not create incorrect tagging' do
      call
      expect(Tagging.count).to eq(1)
    end
  end

  context 'when tagging returns correct records with the already added activity_id and tag_id' do
    before do
      Tagging.create(activity_id: 10, tag_id: 5)
    end

    it 'creates only correct records' do
      expect { call }.to change(Tagging, :count).from(1).to(2)
    end
  end
end
