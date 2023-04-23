class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails, id: :uuid do |t|
      t.string :mail
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
