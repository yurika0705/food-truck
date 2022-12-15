class CreateCalenders < ActiveRecord::Migration[6.0]
  def change
    create_table :calenders do |t|
      t.string :store_name
      t.datetime :start_time
      t.timestamps
    end
  end
end
