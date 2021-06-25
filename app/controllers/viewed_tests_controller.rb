class ViewedTestsController < ApplicationController
  before_action :find_viewed_test, only: %i[show result update]

  def show
  end

  def result
  end

  def update
    @viewed_test.accept!(params[:answer_ids])

    if @viewed_test.completed?
      redirect_to result_viewed_test_path(@viewed_test)
    else
      render :show
    end
  end

  private

  def find_viewed_test
    @viewed_test = ViewedTest.find(params[:id])
  end
end