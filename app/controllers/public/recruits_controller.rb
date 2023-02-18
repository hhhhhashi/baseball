class Public::RecruitsController < ApplicationController
  def index
    #@recruit =Recruit.where(area: params[:area])
    @recruits =Recruit.left_joins(:member).where(members:{ is_deleted: false })
  end

  def area
    @recruits =Recruit.left_joins(:member).where(members:{ is_deleted: false })
    @area =Recruit.where(area: params[:area])
  end

  def show
    @recruit = Recruit.find(params[:id])
    @applies = @recruit.applies.left_joins(:member).where(members:{ is_deleted: false})
    @post_comment = PostComment.new
  end

  def new
    @recruit = Recruit.new
    @member =current_member
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.member_id = current_member.id
    @recruit.save
    redirect_to recruit_path(@recruit)
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    recruit = Recruit.find(params[:id])
    recruit.update(recruit_params)
    redirect_to recruit_path(recruit)
  end

  def destroy
    @recruit = Recruit.find(params[:id])
    @recruit.destroy
    redirect_to admin_root_path
  end

  def check
   @recruit = Recruit.new(recruit_params)
   @member = current_member
  end

  def farvorite
    @good_recruits =current_member.good_recruits
  end

  def search
    if params[:keyword].present?
      @recruits= Recruit.where('content LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @recruits= Recruit.all
    end
  end

  private
  def  recruit_params
    params.require(:recruit).permit(:member_id,:title, :team, :place, :area, :day_and_time, :team_level, :post_period, :content, :image)
  end
end
