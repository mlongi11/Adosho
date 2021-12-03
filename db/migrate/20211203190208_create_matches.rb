class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :pet_id
      t.integer :user_id
      t.float :match_strength

      t.timestamps
    end
  end
end
