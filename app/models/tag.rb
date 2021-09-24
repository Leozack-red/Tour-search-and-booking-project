# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :activities, through: :taggings, dependent: :destroy
  has_many :taggings, dependent: :destroy
end
