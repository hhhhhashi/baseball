class Public::HomesController < ApplicationController
  def top
    @recruits = Recruit.all
  end

  def about
  end
end
