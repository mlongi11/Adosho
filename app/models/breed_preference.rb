# == Schema Information
#
# Table name: breed_preferences
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  breed_id   :integer
#  user_id    :integer
#
class BreedPreference < ApplicationRecord
end
