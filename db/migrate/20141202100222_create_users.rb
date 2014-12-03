class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :user_type
      t.string :mail
      t.string :tel

      t.timestamps
    end
  end
end
