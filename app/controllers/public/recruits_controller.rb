class Public::RecruitsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recruit = Recruit.new
    @member =current_member
  end

  def create
    recruit = Recruit.new(recruit_params)
    recruit.save
    redirect_to "/confirm"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  private

  def  recruit_params
    params.require(:recruit).permit(:title, :team, :area, :day_and_time, :team_level, :post_period, :content)
  end
end
