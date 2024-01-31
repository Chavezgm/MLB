class TeamPlayersController < ApplicationController
  def index

    @team = Team.find(params[:id])
    # require 'pry'; binding.pry
    @players = @team.players
    #is this reffering to the players table?
  end
end