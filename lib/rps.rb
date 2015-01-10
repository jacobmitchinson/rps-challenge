  require 'sinatra/base'

class RPSChallenge < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)

  helpers do 

    def player_name
      player_name = session[:name]
    end

    def computer
      "scissors"
    end

    def check
      p session[:move]
      if computer == session[:move].to_s
        "Draw."
      else 
        "You win."
      end
    end
  end

  get '/' do
    erb :index
  end

  get '/play' do
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
