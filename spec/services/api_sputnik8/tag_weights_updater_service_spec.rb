# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiSputnik8::TagWeightsUpdaterService do
  subject(:call) { described_class.call }

  let(:activity1) { create(:activity, id: 10) }
  let(:tag) { create(:tag, id: 400) }

  before do
    activity1
    tag
    Tagging.create(activity_id: 10, tag_id: 400)
  end

  context 'when activity, tag and taggings are present' do
    it 'update tag for provided tags, activities and taggings', :aggregate_failures do
      expect { call }.to change { Tag.first.weight }.from(0).to(1)
    end
  end

  context 'when loader of tags return correct tag, but loader of activity doesnt return activity' do
    let(:activity1) { nil }

    it 'weight of tag doesnt update', :aggregate_failures do
      expect { call }.not_to change { Tag.first.weight }.from(0)
    end
  end

  context 'when weight of tag already updated' do
    let(:tag) { create(:tag, id: 400, weight: 1) }

    before do
      create(:activity, id: 100)
      Tagging.create(activity_id: 100, tag_id: 400)
    end

    it 'weight of tag no change' do
      expect { call }.to change { Tag.first.weight }.from(1).to(2)
    end
  end
end
