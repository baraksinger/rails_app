class UsersController < ApplicationController

    # this will populate the data befor performing CRUD methods
    before_action :set_user, only: [:get, :update, :destroy]

    # GET /users/:id
    def get
      render json: @user
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
      @user.save
      render json: {id: @user.id}
    end

    # PUT /users/:id
    def update
      @user.update_attributes(user_params)
      render json: @user
    end
    
    # DELETE /users/:id
    def destroy
      @user.destroy
    end

        # POST /users/create_multi
    def create_multi
      @users = []
      params[:users].each { |user|
        @user = User.new(users_params(user))
        @user.save
        @users << @user.id
      }
      render json: {users: @users}
    end

  private
    # Use callbacks to share a common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    #white-list identifies the model attr. that MAY be accessed by the controller methods
    def user_params
      params.require(:user).permit(:name, :lastname)
    end
    def users_params(user)
      user.permit(:name, :lastname)
    end
end
