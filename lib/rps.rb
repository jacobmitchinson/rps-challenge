require 'sinatra/base'
require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'game.rb'

class RPSChallenge < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)

  before do 
    session[:game] ? @game = load(:game) : @game = Game.new; store(:game, @game)
    session[:computer] ? @computer = load(:computer) : @computer = Computer.new; store(:computer, @computer)
  end

  helpers do

    def player
      ObjectSpace._id2ref(session[:player_id])
    end

    def load(object)
      ObjectSpace._id2ref(session[object])
    end

    def new_player
      player = Player.new
      player_name(player)
      store(:player_id, player)
      @game.add_player(player)
      @game.add_player(@computer)
    end

    def player_name(player)
      player.name = session[:name].to_s   
    end

    def store(key, game)
      session[key] = game.object_id
    end

    def check_winner
      @winner = @game.check
      if @winner == @game.player1 
        "#{@game.player1.name} wins."
      elsif @winner == "Draw"
        "Draw."
      else 
        "#{@game.player2.name} wins."
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
    @game.player1.move = params[:move].to_s
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
