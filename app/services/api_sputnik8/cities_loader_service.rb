# frozen_string_literal: true

module ApiSputnik8
  class CitiesLoaderService
    class << self
      def call(count_of_id)
        client = Sputnik8::Client.new(Rails.application.credentials.api_key,
                                      Rails.application.credentials.username)
        set_of_cities(client, count_of_id).each do |id|
          data_of_city = client.city(id)

          City.where(name: data_of_city['name'],
                     weight: data_of_city['providers'],
                     photo: data_of_city.dig('geo', 'description', 'image')).first_or_create(id: id)
        end
      end

      private

      def set_of_cities(client, count_of_id)
        client.cities.first(count_of_id).pluck(:id)
      end
    end
  end
end
