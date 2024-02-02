class TeamPlayersController < ApplicationController
  def index

    @team = Team.find(params[:id])
    # require 'pry'; binding.pry
    @players = @team.players
    #is this reffering to the players table?
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    team.players.create!(name: params[:name], games_played: params[:games_played], hall_of_fame: params[:hall_of_fame])
    redirect_to "/teams/#{team.id}/players"
  end
end