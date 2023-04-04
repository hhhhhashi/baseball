class Admin::RecruitsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :destroy]

  def index
    @member = Member.find(params[:member_id])
    @recruits = @member.recruits
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def destroy
    @recruit = Recruit.find(params[:id])
    @recruit.destroy
    redirect_to admin_root_path
  end
end
