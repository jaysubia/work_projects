class UsersController < ApplicationController
  def edit
  end

  def index
    @users = User.all
    
  end

  def new
  	
  end

  def show
  	@users = User.find(params[:id])
  end 
 def create
 	# fail
    @users = User.create( user_params )
    if @users.save
      flash[:success] = "You have successfully registered!"
      redirect_to :back
    else
      flash[:error] = @users.errors.full_messages
      redirect_to :back
    end
  end

  def update
  end

  def delete
  end

  def destroy
  end
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

