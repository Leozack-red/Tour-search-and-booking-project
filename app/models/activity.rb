# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :city
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :taggings, dependent: :destroy
  validates :city, :title, :description, :photo, :price, :customers_review_rating, presence: true
end
