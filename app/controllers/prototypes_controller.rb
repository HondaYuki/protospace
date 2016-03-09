class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.page(params[:page])
  end

  def show
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = current_user.prototypes.new(create_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @prototype.update(update_params)
    redirect_to prototype_path(@prototype.id)
  end

  def destroy
    @prototype.destroy
    redirect_to :back
  end
  private
  def create_params
    tag_list = params[:prototype][:tag_list]
    params.require(:prototype).permit(:title, :catchcopy, :concept, captured_images_attributes: [:name, :status, :prototype_id]).merge(tag_list: tag_list)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def update_params
    tag_list = params[:prototype][:tag_list]
    params.require(:prototype).permit(:title, :catchcopy, :concept, captured_images_attributes: [:id, :name, :status, :prototype_id]).merge(tag_list: tag_list)
  end
end
