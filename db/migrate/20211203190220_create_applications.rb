class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :pet_id
      t.string :application_type
      t.string :status

      t.timestamps
    end
  end
end
