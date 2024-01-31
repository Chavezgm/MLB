class TeamsController < ApplicationController
  def index 
    @teams = Team.most_recently
  end

  def show 
    @team = Team.find(params[:id])
  end
end