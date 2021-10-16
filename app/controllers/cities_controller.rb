# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    city = City.find(params[:id])
    @presenter = CityPresenter.new(city, page: params[:page])
  end
end
