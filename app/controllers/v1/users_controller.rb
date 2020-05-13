class V1::UsersController < ApplicationController
  
  def index
    @users = User.all
    render json: {status: 'SUCCESS', message: 'Loaded users', data:@users} , status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded user', data:@user} , status: :ok

  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {status: 'SUCCESS', message: 'user saved', data:@user} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save user', data:@user.errors} , status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.where(id: params[:id]).first
    @user.destroy
    render json: {status: 'SUCCESS', message: 'user deleted', data:@user} , status: :ok
  end
   
  def update 
    # puts "***************************************"
    # puts params[:random]
    @user = User.where(id: params[:id]).first
    if @user.update_attributes(user_params)
      render json: {status: 'SUCCESS', message: 'user updated', data:@user} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save user', data:@user.errors} , status: :unprocessable_entity
    end
  
  
  end


  private

  def user_params 
    params.require(:user).permit(:name,:email,:age,:city,:address,:is_Admin,:is_seller,:is_buyer,:is_guest)
  end
end
