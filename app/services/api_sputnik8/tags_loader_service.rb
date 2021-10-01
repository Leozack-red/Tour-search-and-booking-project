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
        created_record = Tag.where(name: tag).first_or_create(weight: 0)
        create_taggings(hash_of_tag, created_record.id)
      end

      def create_taggings(hash_of_tag, create_record)
        list_of_ids = hash_of_tag['products'].pluck('id')
        ApiSputnik8::TaggingsCreatorService.call(list_of_ids, create_record)
      end
    end
  end
end
