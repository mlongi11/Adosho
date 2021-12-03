# == Schema Information
#
# Table name: pets
#
#  id                               :integer          not null, primary key
#  activity_competability_ranking   :integer
#  cat_competability_ranking        :integer
#  children_competability_ranking   :integer
#  dog_competability_ranking        :integer
#  estimated_birthday               :date
#  gender                           :string
#  home_alone_competability_ranking :integer
#  name                             :string
#  notes                            :text
#  picture                          :string
#  species                          :string
#  status                           :string
#  weight                           :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  adopter_id                       :integer
#  foster_id                        :integer
#
class Pet < ApplicationRecord
  # belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "adopter_id" })
  # belongs_to(:foster_parent, { :required => true, :class_name => "User", :foreign_key => "foster_id" })
  # has_many(:watchlists, { :class_name => "Watchlist", :foreign_key => "pet_id", :dependent => :destroy })
  # has_many(:pet_breeds, { :class_name => "PetBreed", :foreign_key => "pet_id", :dependent => :destroy })
  # has_many(:matches, { :class_name => "Match", :foreign_key => "pet_id", :dependent => :destroy })
  # has_many(:applications, { :class_name => "Application", :foreign_key => "pet_id", :dependent => :destroy })

  has_many(:prospective_parents, { :through => :watchlists, :source => :user })
  has_many(:matched_parents, { :through => :matches, :source => :user })

  validates(:species, { :inclusion => { :in => [ "Dog", "Cat" ] } })
  validates(:home_alone_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 } })
  validates(:dog_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 } })
  validates(:children_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 } })
  validates(:cat_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 } })
  validates(:activity_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 } })
end
