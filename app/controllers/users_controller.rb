class UsersController < ApplicationController

    # this will populate the data before performing CRUD methods
    before_action :set_user, only: [:get, :update, :destroy]

    # GET /users/:id
    def get
      render json: @user
    end

    # POST /users
    def create
      @user = User.new(user_params)
      unless user
        render json: {message: 'user not found', error: :user_not_found}, status: :not_found
      end
      @user.save
      render json: {id: @user.id}
    end

    # PUT /users/:id
    def update
      unless user
        render json: {message: 'user not found', error: :user_not_found}, status: :not_found
      end
      @user.update_attributes(user_params)
      render json: @user
    end

    # DELETE /users/:id
    def destroy
      @user.destroy
      render json: {id: @user.id}
    end

    # POST /users/create_multi
    def create_multi
      users = []
      errors = []

      users_params.fetch(users, []).each do |user|
        new_user = ::User.new(user)
        if new_user.valid?
          users << new_user
        else
          errors << user.merge!(error: new_user.errors.messages)
        end
      end

      if errors.length > 0
        render json: {messages: errors, error: :user_invalid}, status: :bad_request
        return
      end

      User.import(users)
      render json: {users: users}
    end

  private
    # Use callbacks to share a common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    #white-list identifies the model attr. that MAY be accessed by the controller methods
    def user_params
      params.require(:user).permit(:name, :lastname, :email)
    end
    def users_params
      params.permit(users: [:name, :lastname, :email])
    end
end
