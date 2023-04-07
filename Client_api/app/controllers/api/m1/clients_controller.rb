class Api::M1::ClientsController < ApplicationController
  def index
    client = Client.all
    render json: client, status:200
  end

  def show
    client = Client.find_by(id: params[:id])
    if client
      render json: client, status:200
    else
      render json: { error: "Client not found"}
    end
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: { error: 'Error creating client' }
    end
  end

  def update
    client = Client.find_by(id: params[:id])
      if client
        client.update(client_params)
        render json: "Client updated successfully"
        return
      else
        render json: { error: 'Error updating client' }
      end
  end

  def destroy
    client = Client.find_by(id: params[:id])
    if client
      client.destroy
      render json: "Client deleted successfully"
    else
      render json: { error: 'Error deleting client' }
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :firstname, 
      :lastname, 
      :gender, 
      :dob,
      :digitalAddress,
      :state,
      :country,
      :mobileNumber,
      :email,
      :password
    )
  end
end
