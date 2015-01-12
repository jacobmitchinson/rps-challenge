require 'sinatra/base'
require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'game.rb'

class RPSChallenge < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)

  before do 
    session[:game] ? @game = game_load : @game = Game.new; game_store(@game)
    session[:computer] ? @computer = computer_load : @computer = Computer.new; computer_store(@computer)
  end

  helpers do

    # refactor

    def player
      ObjectSpace._id2ref(session[:player_id])
    end

    def game_load
      ObjectSpace._id2ref(session[:game])
    end

    def computer_load
      ObjectSpace._id2ref(session[:computer])
    end

    def load(object)
      ObjectSpace._id2ref(session[object.to_s])
    end

    def new_player
      player = Player.new
      player_name(player)
      player_store(player)
      @game.add_player(player)
      @game.add_player(@computer)
    end

    def player_name(player)
      player.name = session[:name].to_s   
    end

    # refactor

    def computer_store(computer)
      session[:computer] = computer.object_id
    end

    def game_store(game)
      session[:game] = game.object_id
    end

    def player_store(player)
      session[:player_id] = player.object_id 
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
