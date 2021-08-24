require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/db_connection'
require './lib/user'

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

  post '/authenticate' do
    user = User.authenticate(params[:email], params[:password])

    session[:current_user_id] = user[:id]
    session[:current_user_name] = user[:name]
    session[:current_user_email] = user[:email]

    redirect '/'
  end

  post '/user/create' do
    new_user = User.create(params[:name], params[:email], params[:password])

    session[:current_user_id] = new_user[:id]
    session[:current_user_name] = new_user[:name]
    session[:current_user_email] = new_user[:email]

    redirect '/'
  end

  run! if app_file == $0
end