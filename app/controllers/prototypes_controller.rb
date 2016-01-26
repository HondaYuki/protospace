class PrototypesController < ApplicationController

  def index
    if params[:id] == 'newest'
      @protos = Proto.all.order('updated_at DESC')
    else
      @protos = Proto.all.order('likes_count DESC')
    end
  end

  def show
    @proto = Proto.find(params[:id])
    @user = @proto.user
    @thumbnails = @proto.thumbnails
    @comments = Comment.where(proto_id: @proto.id)
    @comment = Comment.new
    @likes = @proto.likes

  end

  def new
    @proto = Proto.new
    @proto.thumbnails.new
  end

  def create
    Proto.create(proto_params)
    redirect_to root_path and return
  end

  def destroy
    Proto.find_by_id(params[:id]).destroy
    redirect_to root_path and return
  end

  def edit
    @proto = Proto.find_by_id(params[:id])
  end

  def update
    proto = Proto.find_by_id(params[:id])
    proto.update(proto_params)
    redirect_to root_path and return
  end

  private
  def proto_params
    params.require(:proto).permit(:title, :catchcopy, :concept, thumbnails_attributes: [:image, :status, :id]).merge(user_id: current_user.id, tag_list: params[:proto][:tag])
end
