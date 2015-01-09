require 'sinatra/base'

class RPSChallenge < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)

  helpers do 

    def name_exists?
      !session[:name].nil?
    end

  end

  get '/' do
    erb :index
  end

  post '/name' do 
    name = params[:name]
    session[:name] = name
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
