class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, "secret")
  end

  def decoded_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ').last
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end


  def authorized_usuario
    decoded_token = decoded_token()
    if decoded_token
      usuario_id = decoded_token[0]['usuario_id']
      @usuario = Usuario.find_by(id: usuario_id)
    end
  end


  def authorized
    render json: {error: "Token invalid or not exists"}, status: :unauthorized unless authorized_usuario
  end
end
