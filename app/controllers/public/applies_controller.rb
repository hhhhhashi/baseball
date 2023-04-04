class Public::AppliesController < ApplicationController
  before_action :authenticate_member!, only: [:new, :index, :show, :create, :update]

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
    @apply.create_notification_apply!(current_member, @apply.recruit.member_id, @apply.id)

    redirect_to complete_path
  end

  def update
    #@recruit = Recruit.find(params[:recruit_id])
    @apply = Apply.find(params[:id])
    @apply.update(apply_params)
    redirect_to recruit_path(@apply.recruit_id)
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
