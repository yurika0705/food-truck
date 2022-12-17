class CreateCalenders < ActiveRecord::Migration[6.0]
  def change
    create_table :calenders do |t|
      t.references :location, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.string :store_name, null: false
      t.timestamps
    end
  end
end
