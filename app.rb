require 'sinatra/base'
require 'sinatra/reloader'

require './database_connection_setup'
require './lib/db_connection'
require './lib/user'
require './lib/spaces'


class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  # set :method_override, true

  before do
    user = User.current

    @current_user_id = user.id
    @current_user_name = user.name
    @current_user_email = user.email
    @current_user_spaces = user.spaces

    @all_spaces = Spaces.all
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
    
  end

  get '/logout' do
    session.clear

    redirect '/'
  end


  get '/login' do
    erb :login
    
  end

  get '/spaces' do
    @all_spaces = Spaces.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Spaces.create(name: params[:name], des: params[:des], price: params[:price])
    redirect '/spaces'
  end
 

  post '/authenticate' do
    User.authenticate(params[:email], params[:password])

    redirect '/spaces'
  end

  post '/user/create' do
    user = User.create(params[:name], params[:email], params[:password])

    p user
    redirect '/spaces'
    
  end

  run! if app_file == $0
end