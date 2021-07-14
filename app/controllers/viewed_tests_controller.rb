class ViewedTestsController < ApplicationController
  before_action :find_viewed_test, only: %i[show result update]

  def show
  end

  def result
  end

  def update
    @viewed_test.accept!(params[:answer_ids])

    if @viewed_test.completed?
      check_badges
      TestsMailer.completed_test(@viewed_test).deliver_now
      redirect_to result_viewed_test_path(@viewed_test)
    else
      render :show
    end
  end

  private

  def find_viewed_test
    @viewed_test = ViewedTest.find(params[:id])
  end

  def check_badges
    badges = Badge.give_badges(@viewed_test)

    unless badges.blank?
      current_user.badges.push(badges)

      if badges.count > 1
        flash[:notice] = "Вы получили награды!"
      else
        flash[:notice] = "Вы получили награду!"
      end
    end
  end
end
