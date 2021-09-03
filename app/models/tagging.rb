# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :activity
  belongs_to :tag
end
