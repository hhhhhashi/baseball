class Admin::PostCommentsController < ApplicationController

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_recruit_path(params[:recruit_id])
  end
end
