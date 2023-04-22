class Public::HomesController < ApplicationController
  def top
    #退会した人の募集要項取り除く
    @recruits =Recruit.left_joins(:member).where(members:{ is_deleted: false }).page(params[:page])
  end

  def about
  end
end
