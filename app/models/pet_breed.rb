# == Schema Information
#
# Table name: pet_breeds
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  breed_id   :integer
#  pet_id     :integer
#
class PetBreed < ApplicationRecord
end
