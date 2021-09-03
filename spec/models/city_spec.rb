# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:resource_city) { create(:city) }

  context 'when object is valid' do
    it { expect(resource_city).to be_valid }
  end
end
