class TestsController < ApplicationController
  def index
    render plain: 'All tests'
  end

  def show
    render plain: "Test #{params[:id]}"
  end
end
