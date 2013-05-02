class CreateTypeVehicles < ActiveRecord::Migration
  def change
    create_table :type_vehicles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
