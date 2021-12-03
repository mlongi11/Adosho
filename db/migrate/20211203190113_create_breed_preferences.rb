class CreateBreedPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :breed_preferences do |t|
      t.integer :user_id
      t.integer :breed_id

      t.timestamps
    end
  end
end
