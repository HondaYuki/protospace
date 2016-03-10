class PopularsController < ApplicationController

  def index
    @prototypes = Prototype.order("likes_count desc").page(params[:page]).includes(:tags, :user)
  end
end
