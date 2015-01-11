require 'sinatra/base'
require_relative 'player.rb'

class RPSChallenge < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)


  helpers do 

    def new_player
      @player = Player.new
      player_name(@player)
      player_store(@player)
    end

    def player_name(player)
      player.name = session[:name].to_s   
    end

    def player_store(player)
      session[:player_id] = player.object_id 
    end

    def player
      ObjectSpace._id2ref(session[:player_id])
    end

    def computer
      "scissors"
    end

    def check
      p player
      p player.move
      if computer == player.move
        "Draw."
      elsif player.move == "rock" 
        "You win."
      else 
        "You lose."
      end
    end
  end

  get '/' do
    erb :index
  end

  get '/play' do
    session[:player_id].nil? ? new_player : player
    erb :play
  end

  post '/name' do 
    session[:name] = params[:name]
    redirect '/play'
  end

  post '/move' do
    player.move = params[:move].to_s
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
