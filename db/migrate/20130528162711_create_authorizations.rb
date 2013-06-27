class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :element1
      t.integer :sum1
      t.string :element2
      t.integer :sum2
      t.string :element3
      t.integer :sum3
      t.string :element4
      t.integer :sum4
      t.string :avatar
      t.date :date
      t.boolean :acceptance
      t.references :user
      t.references :destination
      t.references :usability


      t.timestamps
    end
    add_index :authorizations, :user_id
    add_index :authorizations, :destination_id
    add_index :authorizations, :usability_id
  end
end
