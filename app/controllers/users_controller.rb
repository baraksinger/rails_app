class UsersController < ApplicationController

    # this will populate the data befor performing CRUD methods
    # @before_action :set_user, only: [:get, :update]

    # GET /users/:id
    def get
      @user = User.find(params[:id])
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
      @user = User.find(params[:id])
      @user.update_attributes(user_params)
      render json: @user
    end
    
    # def destroy
    #   @user = User.find[params[:id])
    #   @user.destroy
    # end

  private
    # Use callbacks to share a common setup or constraints between actions.
    # def set_user
    #     @user = User.find(params[:id])
    # end

     #white-list identifies the model attr. that MAY be accessed by the controller methods
     def user_params
      params.require(:user).permit(:name, :lastname)
    end
end
