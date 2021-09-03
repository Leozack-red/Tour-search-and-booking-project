# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:resource_activity) { create(:activity) }

  context 'when object is valid' do
    it { expect(resource_activity).to be_valid }
  end
end
