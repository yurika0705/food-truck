class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :place
      t.string :address
      t.string :contact_address
      t.string :fee
      t.text :info
      t.text :image
      t.references :user
      t.references :comment
      t.timestamps
    end
  end
end
