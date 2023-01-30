class Admin::HomesController < ApplicationController
  def top
    @recruit = Recruit.all
  end
end
