class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :surname
      t.string :extension
      t.references :document
      t.string :identification
      t.boolean :genre
      t.string :phone

      t.timestamps
    end
    add_index :responsibles, :document_id
  end
end
 