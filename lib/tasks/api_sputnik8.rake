# frozen_string_literal: true

desc 'Load data of cities from Sputnik8 API'

task cities: :environment do
  ApiSputnik8::CitiesLoaderService.call(100)
end

desc 'Load data of activities from Sputnik8 API'

task activities: :environment do
  ApiSputnik8::ActivitiesLoaderService.call
end
