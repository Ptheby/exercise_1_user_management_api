class UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  
    # GET /users/1
    def show
      render json: @user, status: :ok
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @user.destroy
      render json: { message: 'User was successfully destroyed.' }, status: :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :other_attributes)
    end
  end




end
