# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  account_type    :string
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:preferences, { :class_name => "BreedPreference", :foreign_key => "user_id", :dependent => :destroy })
  has_one(:interest, { :class_name => "Interest", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:pets, { :class_name => "Pet", :foreign_key => "adopter_id", :dependent => :destroy })
  has_many(:watchlists, { :class_name => "Watchlist", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:matches, { :class_name => "Match", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:fosters, { :class_name => "Pet", :foreign_key => "foster_id", :dependent => :destroy })
  has_many(:applications, { :class_name => "Application", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:watched_pets, { :through => :watchlists, :source => :pet })
  has_many(:matched_pets, { :through => :matches, :source => :pet })

  validates(:phone_number, { :format => { :with => "^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$" } })
  validates(:phone_number, { :presence => true })
  validates(:account_type, { :inclusion => { :in => [ "User", "Administrator" ] } })
end

