class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_recruit_path(params[:recruit_id])
  end
end
