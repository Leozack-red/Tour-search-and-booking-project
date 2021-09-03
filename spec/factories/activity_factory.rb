# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    association :city
    city_id { 1 }
    title { 'Обзорная автобусная экскурсия по Москве' }
    description { 'Sputnik8.com — это место' }
    photo { 'https://c7.ucarecdn.com/a7cad563-0370-4bc8-97fb-64c80fa8a618/-/scale_crop/630x420/center/' }
    price { '750.00 руб.' }
    customers_review_rating { 6.6 }
  end
end
