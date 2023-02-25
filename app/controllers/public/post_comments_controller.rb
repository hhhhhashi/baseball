class Public::PostCommentsController < ApplicationController

  def create
    recruit = Recruit.find(params[:recruit_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.recruit_id = recruit.id
    comment.save
    comment.create_notification_post_comment!(current_member, comment.id)
    redirect_to recruit_path(recruit)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
