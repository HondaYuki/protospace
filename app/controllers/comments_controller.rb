class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = current_user.comments.create(create_params)
    @comments = @prototype.comments.includes(:user, :prototype)
  end

  private
  def create_params
    params.require(:comment).permit(:text, :prototype_id)
  end

end
