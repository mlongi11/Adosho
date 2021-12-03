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
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })
end
