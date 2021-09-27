# frozen_string_literal: true

module ApiSputnik8
  class TagsLoaderService
    class << self
      def call
        client = Sputnik8::Client.new(Rails.application.credentials.api_key,
                                      Rails.application.credentials.username)
        Activity.distinct.pluck(:city_id).each do |city_id|
          tags = client.tags(city_id)[0]['sub_categories']
          tags.each do |hash_of_tag|
            create_tag(hash_of_tag)
          end
        end
      end

      private

      def create_tag(hash_of_tag)
        tag = hash_of_tag['short_name']
        Tag.where(name: tag).first_or_create(weight: 0)
      end
    end
  end
end
