# frozen_string_literal: true

module ApiSputnik8
  class ActivitiesLoaderService
    class << self
      def call
        client = Sputnik8::Client.new(Rails.application.credentials.api_key,
                                      Rails.application.credentials.username)
        City.pluck(:id).each do |id|
          client.activities(id).each do |activity|
            create_record(activity)
          end
        end
      end

      private

      def create_record(activity)
        Activity.where(title: activity[:title],
                       description: activity[:description],
                       photo: activity.dig(:main_photo, :small),
                       price: activity[:price],
                       customers_review_rating: activity[:customers_review_rating].to_f)
                .first_or_create(city_id: activity[:city_id])
      end
    end
  end
end
