class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy]
  before_action :find_user, only: %i[new create]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = @user.created_tests.new
  end

  def create
    @test = @user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = current_user
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level)
  end
end