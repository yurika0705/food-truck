class CreateCalenderUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :calender_users do |t|

      t.timestamps
    end
  end
end
