class UsuarioController < ApplicationController
  include Authenticable
  include BCrypt
  # before_action :authenticate_with_token, except: %i[ index]
  before_action :load_usuario, only: %i[ show update destroy]
#Get all
  def index
    @usuario = Usuario.all()
    render json: @usuario, each_serializer: UsuarioSerializer
  end
#POST create User
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.password = @usuario.create_hash(usuario_params[:password])
    if @usuario.save
      render json: @usuario, status: :created, each_serializer: UsuarioSerializer
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end
  def login
    @usuario = Usuario.find_by(username: usuario_params[:username])
    if @usuario && @usuario.authenticate(@usuario.password) == usuario_params[:password]
      token = encode_token({usuario_id: @usuario.id})
      render json: {token: token}, status: :ok
    else
      render json: {error: "Usuário ou senha inválidos"}, status: :unprocessable_entity
    end
  end
  #PATH Update User
  def update
    if @usuario.update(usuario_params)
      render json: @usuario, each_serializer: UsuarioSerializer
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end
  #DELETE Delete User
  def destroy
    @usuario.destroy
  end
  private
    def load_usuario
      @usuario = Usuario.find(params[:id])
    end
    def usuario_params
      params.require(:usuario).permit(:username, :email, :password)
    end
end
