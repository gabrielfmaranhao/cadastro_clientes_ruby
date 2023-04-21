class CreateTelefones < ActiveRecord::Migration[7.0]
  def change
    create_table :telefones, id: :uuid do |t|
      t.string :number
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
