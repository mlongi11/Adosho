class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :estimated_birthday
      t.string :status
      t.integer :adopter_id
      t.string :gender
      t.string :weight
      t.integer :children_competability_ranking
      t.integer :dog_competability_ranking
      t.integer :cat_competability_ranking
      t.integer :home_alone_competability_ranking
      t.integer :activity_competability_ranking
      t.text :notes
      t.integer :foster_id
      t.string :species

      t.timestamps
    end
  end
end
