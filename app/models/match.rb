# == Schema Information
#
# Table name: matches
#
#  id             :integer          not null, primary key
#  match_strength :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pet_id         :integer
#  user_id        :integer
#
class Match < ApplicationRecord
end
