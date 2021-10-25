# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def show
    @view_activity = ActivityPresenter.new(id: params[:id])
  end

  def index
    @main_page = MainPagePresenter.new(page: params[:page])
  end
end
