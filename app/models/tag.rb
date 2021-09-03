# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :activities, through: :taggings
  has_many :taggings, dependent: :destroy
end
