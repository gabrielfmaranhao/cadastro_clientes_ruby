class AddUsuarioAtToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :usuario_at_cadastro, :string
  end
end
