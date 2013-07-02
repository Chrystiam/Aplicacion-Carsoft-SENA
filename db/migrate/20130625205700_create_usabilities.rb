class CreateUsabilities < ActiveRecord::Migration
  def change
    create_table :usabilities do |t|
      t.string :name
      t.string :initials

      t.timestamps
    end
  end
end
