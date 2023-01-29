class Public::MembersController < ApplicationController
  def show
    @member = current_member
    @recruits = current_member.recruits
  end

  def edit
    @member=current_member
  end

  def update
    member=current_member
    member.update(member_params)
    redirect_to my_page_path
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
    params.require(:member).permit(:last_name, :first_name, :old, :birthday, :sex, :telephone_number, :email, :introduction, :is_deleted)
  end

end
