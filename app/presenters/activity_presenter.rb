# frozen_string_literal: true

class ActivityPresenter
  attr_reader :activity

  def initialize(id: 1)
    @activity = Activity.find(id)
  end
end
