class Public::HomesController < ApplicationController
  def top
    @recruits =Recruit.left_joins(:member).where(members:{ is_deleted: false }).page(params[:page])
  end

  def about
  end
end
