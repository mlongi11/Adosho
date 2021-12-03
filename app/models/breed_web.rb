# == Schema Information
#
# Table name: breed_webs
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  primary_breed_id :integer
#  similar_breed_id :integer
#
class BreedWeb < ApplicationRecord
end
