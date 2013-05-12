class MicroPost < ActiveRecord::Migration
 def up
    create_table :microposts do |t|
      t.string :content
      t.integer :usuario_id
      t.timestamps
    end
  end

  def down
    drop_table :microposts
  end
end
