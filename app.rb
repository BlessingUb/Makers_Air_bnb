require 'sinatra/base'
require 'sinatra/reloader'

require './database_connection_setup'
require './lib/db_connection'
require './lib/user'
require './lib/space'


class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # set :method_override, true

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
    @all_spaces = Space.all
    p @all_spaces
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    if @user.logged_in?
    @space = Space.create(params[:name], params[:description], params[:price])
    
    redirect '/spaces'
  end
 

  post '/authenticate' do
    @user = User.authenticate(params[:email], params[:password])
    redirect '/spaces'
  end

  post '/user/create' do
    @new_user = User.create(params[:name], params[:email], params[:password])
     
    #redirect '/'
    redirect '/login'
    
  end

  run! if app_file == $0
end