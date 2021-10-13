# frozen_string_literal: true

class MainPageController < ApplicationController
  def index
    @main_page = MainPagePresenter.new(page: params[:page])
  end
end
