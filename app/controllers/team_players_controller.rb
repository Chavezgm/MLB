class TeamPlayersController < ApplicationController
  def index

    @team = Team.find(params[:id])
    @players = @team.players
    # require 'pry'; binding.pry
    
    if params[:sort] == 'true'
      @players = @players.alphabetical_order
    end

    if params[:games_played]
      @players = @players.games_played_over(params[:games_played])
    end

    
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    team.players.create!(name: params[:name], games_played: params[:games_played], hall_of_fame: params[:hall_of_fame])
    redirect_to "/teams/#{team.id}/players"
  end

  def destroy
    team = Team.find(params[:team_id])
    player = team.players.find(params[:id])
    player.destroy
    redirect_to "/teams/#{team.id}/players"
  end
end