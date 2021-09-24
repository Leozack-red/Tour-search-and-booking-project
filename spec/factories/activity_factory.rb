# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    association :city
    title { 'Обзорная автобусная экскурсия по Москве' }
    description { 'Sputnik8.com — это место' }
    photo { 'https://c7.ucarecdn.com/a7cad563' }
    price { '750.00 руб.' }
    customers_review_rating { 6.6 }
  end
end
