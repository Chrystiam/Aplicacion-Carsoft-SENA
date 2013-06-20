class CreatePorters < ActiveRecord::Migration
  def change
    create_table :porters do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :phone
      t.references :turn

      t.timestamps
    end
    add_index :porters, :turn_id
  end
end
 