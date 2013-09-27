require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative '../lib/user'
# require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'my unique encryption key!'
use Rack::Flash
set :partial_template_engine, :erb


get '/' do
  erb :index
end

post '/sessions' do
  email,password = params[:email], params[:password]
  user = User.authenticate(email,password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else 
    flash[:errors] = ["The email or passwords is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Goodbye"
  session[:user_id] = nil
  redirect to('/')
end

get '/sessions/new' do 
  erb :"sessions/new"
end

get '/users/new' do
  # note the view is in views/users/new.erb
  # we need the quotes because otherwise
  # ruby would divide the symbol :users by the
  # variable new (which makes no sense)
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(:email => params[:email], 
              :username => params[:username],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])  
  # the user id will be nil if the user wasn't saved when password didn't match
  
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else 
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end


helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end