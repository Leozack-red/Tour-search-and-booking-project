# frozen_string_literal: true

module ApiSputnik8
  class TaggingsCreatorService
    class << self
      def call(list_of_ids, id_of_tag)
        (list_of_ids & Activity.pluck(:id)).each do |activity_id|
          Tagging.where(activity_id: activity_id, tag_id: id_of_tag).first_or_create
        end
      end
    end
  end
end
