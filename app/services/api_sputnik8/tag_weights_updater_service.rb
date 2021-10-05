# frozen_string_literal: true

module ApiSputnik8
  class TagWeightsUpdaterService
    class << self
      def call
        Tag.find_each do |tag|
          tag.update(weight: tag.activities.count)
        end
      end
    end
  end
end
