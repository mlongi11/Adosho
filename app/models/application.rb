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
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })

  validates(:status, { :inclusion => { :in => [ "Pending", "Approved", "Denied" ] } })
  validates(:application_type, { :inclusion => { :in => [ "Adoption", "Foster" ] } })
end
