class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email

      t.timestamps null: false
    end
    add_index :users, :name
    add_index :users, :username
    add_index :users, :email
  end
end
