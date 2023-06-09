class ClientesController < ApplicationController
  before_action :authorized, only: %i[ show update destroy create]
  before_action :set_cliente, only: %i[ show update destroy ]



  # GET /clientes
  def index
    @clientes = Cliente.all

    render json: @clientes, each_serializer: ClienteSerializer
  end

  # GET /clientes/1
  def show
    render json: @cliente, each_serializer: ClienteSerializer
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params.merge(usuario: @usuario, usuario_at_cadastro: @usuario.username))
    if @cliente.save
      render json: @cliente, status: :created, location: @cliente, each_serializer: ClienteSerializer
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clientes/1
  def destroy
    @cliente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:name, :cpf, :telefones)
    end
end
