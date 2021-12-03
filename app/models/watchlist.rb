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
end
