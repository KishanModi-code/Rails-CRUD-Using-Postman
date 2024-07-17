class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
    # render json: @users
    #  if @users.empty?
    #   head :no_content
    # else
    #   render json: @users
    # end
    respond_to do |format|
    format.html { render :index } # This will render app/views/users/index.html.erb
    # format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'Sorry, User not found' }, status: :not_found        
  end

  def create
    @users = User.new(user_params)

    if @users.save
      render json: { message: 'User was successfully created!!!' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end 
  
  def update
    @user = User.find_by(id: params[:id])
    
    if @user
      if @user.update(user_params)
        render json: { message: 'User updated successfully!!!', user: @user }, status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Sorry, User not found OR Deleted' }, status: :not_found
    end
  end  
  
  def destroy
    @user = User.find_by(id: params[:id])
    
    if @user
      @user.destroy
      render json: { message: 'User deleted successfully!!!' }, status: :ok
    else
      render json: { error: 'Sorry, User Alredy Deleted' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :mobilenumber)
  end 
end




  
  

  