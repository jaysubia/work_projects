class SessionsController < ApplicationController
  # add restrictions for profile - only logged in user can go to profile. 
def index

end


def logout
  if session[:user_id] != nil 
    session[:user_id] = nil
  elsif session[:rep_id] != nil
    session[:rep_id] = nil
  elsif session[:admin_id]!= nil
    session[:admin_id] = nil
  end
	reset_session
	redirect_to '/'
end

def profile
  if session[:user_id] != nil
    @user = User.find(session[:user_id])
  elsif session[:rep_id] != nil
    @rep = Rep.find(session[:rep_id])
  elsif session[:admin_id] != nil
    @admin = Administrator.find(session[:admin_id])
  end
end


def login 
  admin = Administrator.find_by_email(params[:email])
  user = User.find_by_email(params[:email])
  if admin == nil 
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		flash[:message] = "Hello #{user.first_name}!"
  		redirect_to '/users/index'
    end
  elsif user == nil
  	if admin && admin.authenticate(params[:password])
  		session[:admin_id] = admin.id
  		flash[:message] = "Hello #{admin.first_name}"
  		redirect_to '/administrators/index'
    end
  else 
  	fail
  end
end
end