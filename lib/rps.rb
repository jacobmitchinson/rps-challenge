require 'sinatra/base'
require 'player'

class RPSChallenge < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)


  helpers do 

    def player_create
      @player = Player.new
      player_name(@player)
    end

    def player_name(player)
      player.name = session[:name].to_s   
    end

    def computer
      "scissors"
    end

    def check
      p session[:move]
      if computer == session[:move]
        "Draw."
      elsif session[:move] == "rock" 
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
    player_create
    erb :play
  end

  post '/name' do 
    session[:name] = params[:name]
    redirect '/play'
  end

  post '/move' do
    p params[:move] 
    session[:move] = params[:move]
    p session[:move]
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
