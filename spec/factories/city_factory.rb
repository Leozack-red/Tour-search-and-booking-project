# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { 'Санкт-Петербург' }
    photo { 'https://c7.ucarecdn.com/d78f5286-e763-4a95-9cee-b7c43c36bedc/-/scale_crop/200x200/center/-/quality/best/' }
    weight { 15 }
  end
end
