# == Schema Information
#
# Table name: watchlists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pet_id     :integer
#  user_id    :integer
#
class Watchlist < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })
end
