class Public::AppliesController < ApplicationController
  def new
    @apply = Apply.new
    @recruit = Recruit.find(params[:id])
  end

  def index
  end

  def show
  end

  def create
  end

  def confirm
  end

  def complete
  end
end
