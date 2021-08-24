require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
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

  get '/spaces' do
    @spaces = Spaces.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Spaces.create(name: params[:name], des: params[:des], price: params[:price])
    redirect '/spaces'
  end
  # get '/login' do
  #   erb :login
  # end

  # post '/authenticate' do
  #   user = DBConnection.query(
  #     "SELECT * FROM users
  #      WHERE email='#{params[:email]}';"
  #   )

  #   hsh = [:id, :name, :email, :password].zip(user.values.flatten).to_h

  #   puts hsh

  #   session[:current_user_id] = user[:id]
  #   session[:current_user_name] = user[:name]
  #   session[:current_user_email] = user[:email]

  #   redirect '/'
  # end

  post '/user/create' do
    new_user = DBConnection.query(
      "INSERT INTO users(name, email, password)
       VALUES('#{params[:name]}', '#{params[:email]}', '#{params[:password]}')
       RETURNING *;"
      )

      hsh = [:id, :name, :email, :password].zip(new_user.values.flatten).to_h

    session[:current_user_id] = hsh[:id]
    session[:current_user_name] = hsh[:name]
    session[:current_user_email] = hsh[:email]

    redirect '/'
  end

  run! if app_file == $0
end