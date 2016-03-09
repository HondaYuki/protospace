class UsersController < ApplicationController
before_action :set_user, only: :show

  def edit
  end

  def update
    current_user.update(edit_params)
    redirect_to root_path
  end

  def show
    @prototypes = @user.prototypes.page(params[:page]).includes(:tags)
  end

  private
    def edit_params
      params.require(:user).permit(:username, :email, :member, :profile, :works, :avatar)
    end

    def set_user
      @user = User.find(params[:id])
    end
end