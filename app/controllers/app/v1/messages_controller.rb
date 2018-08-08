class Api::V1::MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages, include: [:commodity, :user]
  end

  def show
    message = Message.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded Message', data: message}, status: :ok
  end

  def create
    message = Message.new(message_params)
    if message.save
      render json: {status: 'SUCCESS', message: 'Loaded Message', data: message}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Message Not Saved', data: message.errors}, status: :unprocessable_entity
    end
  end

  def update
    message = Message.find(params[:id])
    if message.update_attributes(message_params)
      render json: {status: 'SUCCESS', message: 'Updated Message', data: message}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Message Not Updated', data: message.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    render json: {status: 'SUCCESS', message: 'Deleted Message', data: message}, status: :ok
  end

  private

  def message_params
    params.permit(:sender_id, :receiver_id, :content, :date_time)
  end


end
