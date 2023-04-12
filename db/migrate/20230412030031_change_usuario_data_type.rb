class ChangeUsuarioDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :cliente, :usuario_id, :uuid
  end
end
