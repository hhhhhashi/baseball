class Public::MembersController < ApplicationController
  before_action :authenticate_member!, except: [:detail]
  

  def show
    @member = current_member
    @recruits = current_member.recruits
  end

  def detail
    @member = Member.find(params[:id])
  end

  def edit
    @member=current_member
  end

  def update
    member=current_member
    if member.update(member_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to my_page_path
    else
      @member=current_member
      render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :old, :birthday, :sex, :telephone_number, :email, :introduction, :is_deleted, :profile_image)
  end
end
