class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.git_hub_token)
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response&.status == 201 ? true : false
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end
end
