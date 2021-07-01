class TestsMailer < ApplicationMailer
  def completed_test(viewed_test)
    @user = viewed_test.user
    @test = viewed_test.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end
end
