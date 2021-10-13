# frozen_string_literal: true

class MainPagePresenter
  ACTIVITIES_COUNT = 50

  attr_reader :page

  def initialize(page: 1)
    @page = page
  end

  def pagination
    Activity.paginate(page: page, per_page: ACTIVITIES_COUNT)
  end

  def cities_names
    City.pluck(:name).sort
  end
end
