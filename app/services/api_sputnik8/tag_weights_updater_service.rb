# frozen_string_literal: true

module ApiSputnik8
  class TagWeightsUpdaterService
    class << self
      def call
        Tag.find_each do |tag|
          Tag.update(tag.id, weight: Tagging.where(tag_id: tag.id).count)
        end
      end
    end
  end
end
