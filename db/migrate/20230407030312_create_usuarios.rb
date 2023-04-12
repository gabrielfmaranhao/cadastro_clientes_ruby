class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios, id: :uuid do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
