class Usuarios < ActiveRecord::Migration
  def up
    create_table :usuarios do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.timestamps
    end
  end

  def down
    drop_table :usuarios 
  end
end
