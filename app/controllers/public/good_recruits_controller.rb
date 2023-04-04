class Public::GoodRecruitsController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]

  def create
    recruit = Recruit.find(params[:recruit_id])
    good_recruit = current_member.good_recruits.new(recruit_id: recruit.id)
    good_recruit.save
    good_recruit.create_notification_good_recruit!(current_member, good_recruit.recruit.member_id, good_recruit.id )

    redirect_to recruit_path(recruit)


  end

  def destroy
    recruit = Recruit.find(params[:recruit_id])
    good_recruit = current_member.good_recruits.find_by(recruit_id: recruit.id)
    good_recruit.destroy
    redirect_to recruit_path(recruit)
  end
end
