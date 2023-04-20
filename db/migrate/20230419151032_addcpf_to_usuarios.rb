class AddcpfToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :cpf, :string
  end
end
