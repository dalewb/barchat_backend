class PermissionsController < ApplicationController

  def index
    permissions = Permission.all
    render json: permissions, include: [:commodity, :user]
  end

  def show
    permission = Permission.find(params[:id])
    render json: {status: 'SUCCESS', permission: 'Loaded Permission', data: permission}, status: :ok
  end

  def create
    permission = Permission.new(permission_params)
    if permission.save
      render json: {status: 'SUCCESS', permission: 'Loaded Permission', data: permission}, status: :ok
    else
      render json: {status: 'ERROR', permission: 'Permission Not Saved', data: permission.errors}, status: :unprocessable_entity
    end
  end

  def update
    permission = Permission.find(params[:id])
    if permission.update_attributes(permission_params)
      render json: {status: 'SUCCESS', permission: 'Updated Permission', data: permission}, status: :ok
    else
      render json: {status: 'ERROR', permission: 'Permission Not Updated', data: permission.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    permission = Permission.find(params[:id])
    permission.destroy
    render json: {status: 'SUCCESS', permission: 'Deleted Permission', data: permission}, status: :ok
  end

  private

  def permission_params
    params.permit(:permitter_id, :permittee_id)
  end

end
