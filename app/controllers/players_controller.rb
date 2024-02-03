class PlayersController < ApplicationController 
  def index 
    @players = Player.true_records
  end

  def show 
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update 
    player = Player.find(params[:id])
    player.update(name: params[:name], hall_of_fame: params[:hall_of_fame], games_played: params[:games_played] )
    redirect_to "/players/#{player.id}"
  end
end