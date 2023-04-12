class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :cpf
      t.references :usuario, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
