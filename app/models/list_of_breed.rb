# == Schema Information
#
# Table name: list_of_breeds
#
#  id         :integer          not null, primary key
#  species    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ListOfBreed < ApplicationRecord
end
