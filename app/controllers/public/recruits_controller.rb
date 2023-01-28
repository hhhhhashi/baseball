class Public::RecruitsController < ApplicationController
  def index
    @recruits=Recruit.all
  end

  def show
  end

  def new
    @recruit = Recruit.new
    @member =current_member
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.member_id = current_member.id
    @recruit.save!
    redirect_to recruit_path(@recruit)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def check
   @recruit = Recruit.new(recruit_params)
   @member = current_member
  end

  private
  def  recruit_params
    params.require(:recruit).permit(:member_id,:title, :team, :area, :day_and_time, :team_level, :post_period, :content)
  end
end
