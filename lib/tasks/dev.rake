desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'

  User.destroy_all
  Pet.destroy_all

  5.times do
    user = User.new
    user.first_name = Faker::Name.first_name 
    user.last_name = Faker::Name.last_name
    user.email = "#{user.first_name}.#{user.last_name}@adopti_test.com"
    user.password = "password"
    user.phone_number = "5555555555"
    user.account_type = "User"
    user.save
  end
  p "Added #{User.count} Users"

  100.times do 
    pet = Pet.new
    pet.activity_competability_ranking = rand(6)
    pet.cat_competability_ranking = rand(6)
    pet.children_competability_ranking = rand(6)
    pet.dog_competability_ranking = rand(6)
    pet.home_alone_competability_ranking = rand(6)
    pet.gender = 
        (if rand(2) == 1
          "Male"
        else
          "Female"
        end)
    pet.species =
      (if rand(2) == 1
        "Cat"
      else
        "Dog"
      end)
    pet.name = 
      (if pet.species == "Dog"
        Faker::Creature::Dog.name
      else
        Faker::Creature::Cat.name
      end)
    pet.picture = "https://robohash.org/#{pet.name}?set=set4"
    pet.save
    #  estimated_birthday               :date
    #  notes                            :text
    #  status                           :string
    #  weight                           :string
  end
  p "Added #{Pet.count} Pets"

end
