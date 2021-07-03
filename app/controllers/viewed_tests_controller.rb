class ViewedTestsController < ApplicationController
  before_action :find_viewed_test, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @viewed_test.accept!(params[:answer_ids])

    if @viewed_test.completed?
      TestsMailer.completed_test(@viewed_test).deliver_now
      redirect_to result_viewed_test_path(@viewed_test)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@viewed_test.current_question)
    result = service.call

    flash_options = if service.success?
      current_user.gists.create!(question: @viewed_test.current_question, url: result.html_url)
      { notice: "#{link_to_gist(result.html_url)} #{t('.success')}"  }
    else
      { alert: t('.failure')}
    end

    redirect_to @viewed_test, flash_options
  end

  private

  def find_viewed_test
    @viewed_test = ViewedTest.find(params[:id])
  end

  def link_to_gist(gist_url)
    view_context.link_to 'Gist', gist_url, target: :_blank, rel: :nofollow
  end
end
