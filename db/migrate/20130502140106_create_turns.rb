class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.date :date

      t.timestamps
    end
  end
end
