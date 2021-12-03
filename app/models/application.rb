# == Schema Information
#
# Table name: applications
#
#  id               :integer          not null, primary key
#  application_type :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pet_id           :integer
#  user_id          :integer
#
class Application < ApplicationRecord
end
