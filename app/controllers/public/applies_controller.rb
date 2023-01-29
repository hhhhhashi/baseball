class Public::AppliesController < ApplicationController
  def new
    @apply = Apply.new
    @recruit = Recruit.find(params[:recruit_id])
  end

  def index
    @applies = current_member.applies
  end

  def show
    @apply = Apply.find(params[:id])
  end

  def create
    @apply = Apply.new(apply_params)
    @apply.save
    redirect_to root_path
  end

  def confirm
  end

  def complete
  end

  private

  def apply_params
    params.require(:apply).permit(:member_id, :recruit_id, :is_apply)
  end

end
