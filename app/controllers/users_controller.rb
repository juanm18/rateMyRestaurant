class UsersController < ApplicationController
  def login
    if request.post?
      user = User.find_by({username: params[:username], password: params[:password]})
      if user.errors.any?
        flash[:loginError] = user.errors.full_messages
        redirect_to '/'
      else
        session[:id] = user.id
        session[:name] = user.username
        redirect_to '/restaurants'
      end
    end
  end

  def new
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    @user.save
    puts "*********"
    puts @user.errors.full_messages
    puts "*********"
    if @user.errors.any? == true
      flash[:error] = @user.errors.full_messages
      redirect_to '/'
    else
      session[:id] = @user.id
      session[:name] = @user.username
      redirect_to '/restaurants'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
