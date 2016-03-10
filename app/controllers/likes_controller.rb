class LikesController < ApplicationController
  def create
    Like.create(create_params)
    @proto = Proto.find_by_id(params[:proto_id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id]).destroy
    @prototype = Prototype.find(params[:prototype_id])
  end

  private
  def create_params
    params.permit(:proto_id).merge(user_id: current_user.id)
  end

end
