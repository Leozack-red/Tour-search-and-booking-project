# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:resource_tag) { create(:tag) }

  context 'when object is valid' do
    it { expect(resource_tag).to be_valid }
  end
end
