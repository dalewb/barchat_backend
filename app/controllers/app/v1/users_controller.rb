class UsersController < ApplicationController

  def index
    users = User.all
    render json: users, include: [:commodity, :user]
  end

  def show
    user = User.find(params[:id])
    render json: {status: 'SUCCESS', user: 'Loaded User', data: user}, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 'SUCCESS', user: 'Loaded User', data: user}, status: :ok
    else
      render json: {status: 'ERROR', user: 'User Not Saved', data: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: {status: 'SUCCESS', user: 'Updated User', data: user}, status: :ok
    else
      render json: {status: 'ERROR', user: 'User Not Updated', data: user.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {status: 'SUCCESS', user: 'Deleted User', data: user}, status: :ok
  end

  private

  def user_params
    params.permit(:description, :viewable, :location_id, :age, :gender)
  end

end
