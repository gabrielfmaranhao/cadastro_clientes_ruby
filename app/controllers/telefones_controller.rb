class TelefonesController < ApplicationController
  before_action :authorized, only: %i[ index show update destroy create]
  before_action :set_telefone, only: %i[ update destroy ]
  before_action :set_cliente, only: %i[ create ]

  # GET /telefones
  def index
    @telefones = Telefone.all

    render json: @telefones
  end

  # GET /telefones/1
  def show
    @cliente = Cliente.find(params[:id])
    render json: @cliente.telefones
  end

  # POST /telefones
  def create

    @telefone = Telefone.new(telefone_params.merge(cliente: @cliente))

    if @telefone.save
      render json: @telefone, status: :created, location: @telefone
    else
      render json: @telefone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /telefones/1
  def update
    if @telefone.update(telefone_params)
      render json: @telefone
    else
      render json: @telefone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /telefones/1
  def destroy
    @telefone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telefone
      @telefone = Telefone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telefone_params
      params.require(:telefone).permit(:number, :cliente_id)
    end
    def set_cliente
      @cliente = Cliente.find(params[:id_client])
    end
end
