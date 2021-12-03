class CreateListOfBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :list_of_breeds do |t|
      t.string :species

      t.timestamps
    end
  end
end
