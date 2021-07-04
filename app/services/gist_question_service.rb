# frozen_string_literal: true

class GistQuestionService
  GistQuestionService::Responce = Struct.new(:status, :url) do
    SUCCESS_CODE = 201

    def success?
      status == SUCCESS_CODE
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.git_hub_token)
  end

  def call
    responce = @client.create_gist(gist_params)
    GistQuestionService::Responce.new(@client.last_response&.status, responce.html_url)
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
    [@question.text, *@question.answers.pluck(:text)].join("\n")
  end
end
