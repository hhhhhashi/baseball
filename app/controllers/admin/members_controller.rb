class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update]

  def index
    @members=Member.all
  end

  def show
    @member=Member.find(params[:id])
  end

  def edit
    @member=Member.find(params[:id])
  end

  def update
    member= Member.find(params[:id])
    member.update(member_params)
    redirect_to admin_member_path(member)
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :old, :birthday, :sex, :telephone_number, :email, :introduction, :is_deleted)
  end


end
