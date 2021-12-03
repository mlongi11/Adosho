class CreateBreedWebs < ActiveRecord::Migration[6.0]
  def change
    create_table :breed_webs do |t|
      t.integer :primary_breed_id
      t.integer :similar_breed_id

      t.timestamps
    end
  end
end
