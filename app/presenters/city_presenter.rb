# frozen_string_literal: true

class CityPresenter
  ACTIVITIES_COUNT = 50

  attr_reader :city, :page

  def initialize(city, page: 1)
    @city = city
    @page = page
  end

  def pagination
    city.activities.paginate(page: page, per_page: ACTIVITIES_COUNT)
  end
end
