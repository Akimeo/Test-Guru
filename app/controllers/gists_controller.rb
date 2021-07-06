class GistsController < ApplicationController
  before_action :find_viewed_test, only: :create

  def create
    result = GistQuestionService.new(@viewed_test.current_question).call

    flash_options = if result.success?
      current_user.gists.create!(question: @viewed_test.current_question, url: result.url)
      { notice: "#{link_to_gist(result.url)} #{t('.success')}"  }
    else
      { alert: t('.failure')}
    end

    redirect_to @viewed_test, flash_options
  end

  private

  def find_viewed_test
    @viewed_test = ViewedTest.find(params[:viewed_test_id])
  end

  def link_to_gist(gist_url)
    view_context.link_to 'Gist', gist_url, target: :_blank, rel: :nofollow
  end
end
