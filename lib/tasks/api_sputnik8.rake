# frozen_string_literal: true

desc 'Load data of cities from Sputnik8 API'

task cities: :environment do
  ApiSputnik8::CitiesLoaderService.call(100)
end

desc 'Load data of activities from Sputnik8 API'

task activities: :environment do
  ApiSputnik8::ActivitiesLoaderService.call
end

desc 'Loading tag data with 0 weights from the Sputnik8 API'

task tags: :environment do
  ApiSputnik8::TagsLoaderService.call
end

desc 'Updating tags from 0 weights'

task weights: :environment do
  ApiSputnik8::TagWeightsUpdaterService.call
end
