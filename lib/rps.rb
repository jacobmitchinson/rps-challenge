require 'sinatra/base'

class RPSChallenge < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)

  helpers do 

    def name 
      name = session[:name]
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

  # start the server if ruby file executed directly
  run! if app_file == $0
end
