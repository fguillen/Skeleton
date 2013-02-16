class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.references :item, :null => false
      t.attachment :attach
      t.integer :position, :null => false
      t.timestamps
    end
  end
end
