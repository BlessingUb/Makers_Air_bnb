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
    @current_user_id = session[:current_user_id]
    @current_user_name = session[:current_user_name]
    @current_user_email = session[:current_user_email]
    @current_user_spaces = session[:current_user_spaces]
    @space_name = session[:space_name]
    @space_description = session[:space_description]
    @space_price = session[:space_price]
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
    p @all_spaces
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    space = Spaces.create(params[:name], params[:des], params[:price])
    session[:space_name] = space[:name]
    session[:spec_description] = space[:des]
    session[:space_price] = space[:price]
    redirect '/spaces'
  end
 

  post '/authenticate' do
    user = User.authenticate(params[:email], params[:password])

    session[:current_user_id] = user[:id]
    session[:current_user_name] = user[:name]
    session[:current_user_email] = user[:email]
    redirect '/spaces'
  end

  post '/user/create' do
    new_user = User.create(params[:name], params[:email], params[:password])

    session[:current_user_id] = new_user[:id]
    session[:current_user_name] = new_user[:name]
    session[:current_user_email] = new_user[:email]

    #redirect '/'
    redirect '/spaces'
    
  end

  run! if app_file == $0
end