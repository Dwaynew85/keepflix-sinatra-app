class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pic_url
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
