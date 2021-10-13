# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#first_sentence' do
    let(:first_sentence) { helper.first_sentence(text) }
    let(:text) { 'Sputnik8. Новая экскурсия.' }

    it 'return the one correct sentence', :aggregate_failures do
      expect(first_sentence).to eq('Sputnik8.')
    end
  end
end
