class AccessController < ApplicationController
  
before_action :confirm_logged_in, :except => [:attempt_login, :logout]


  def menu
  end

  	def login 
  # admin = Administrator.find_by_email(params[:email])
  # user = User.find_by_email(params[:email])
  # if admin == nil 
  # 	if user && user.authenticate(params[:password])
  # 		session[:user_id] = user.id
  # 		flash[:success] = "Hello #{user.first_name}!"
  # 		redirect_to '/users/index'
  #   end
  # elsif user == nil
  # 	if admin && admin.authenticate(params[:password])
  # 		session[:admin_id] = admin.id
  # 		flash[:success] = "Hello #{admin.first_name}"
  # 		redirect_to '/administrators/index'
  #   end
  # else 
  # 	fail
  # end
end

  def attempt_login
  	if params[:email].present? && params[:password].present?
  		found_user = User.where(:email => params[:email]).first
  	if found_user
  		authorized_user = found_user.authenticate(params[:password])
  	end
  end

  	if authorized_user
  		session[:user_id] = authorized_user.id
  		flash[:success] = "You are now logged in."
  		redirect_to(access_login_path)
  	else
  		flash.now[:notice] = "Invalid username/password combination."
  		render('/')
  	end	
end


  def logout
  	session[:user_id] = nil
  	flash[:notice] = 'Logged Out'
  	redirect_to(root_path)
  end

  private

  def confirm_logged_in

  	unless session[:user_id]
  		flash[:notice] = "Please Log In"
  		redirect_to(root_path)
  		false
  	end

  end
end
