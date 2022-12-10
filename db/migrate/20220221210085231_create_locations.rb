class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :place,                     null:false
      t.string :address,                   null: false
      t.string :contact_address,           null: false
      t.string :fee
      t.text :info
      t.text :image
      t.references :user,                  null: false, foreign_key: true

      t.timestamps
    end
  end
end
