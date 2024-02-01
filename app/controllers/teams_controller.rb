class TeamsController < ApplicationController
  def index 
    @teams = Team.most_recently
  end

  def show 
    @team = Team.find(params[:id])
  end

  def new 
  end

  def create 
    team = Team.create(name: params[:name], year_founded: params[:year_founded], world_series_appearance: params[:world_series_appearance])
    # team = Team.create(team_params)
    redirect_to "/teams"
  end

  private

  def team_params
    params.permit(:name, :year_founded,:world_series_appearance)
  end
end