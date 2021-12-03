class CreatePetBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :pet_breeds do |t|
      t.integer :breed_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
