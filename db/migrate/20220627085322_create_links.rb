class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :main_url
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.integer :clicks

      t.timestamps
    end
  end
end
