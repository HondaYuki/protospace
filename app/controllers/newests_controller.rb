class NewestsController < ApplicationController
  
  def index
    @prototypes = Prototype.order(updated_at: :desc).page(params[:page]).includes(:tags, :user)
  end
end
