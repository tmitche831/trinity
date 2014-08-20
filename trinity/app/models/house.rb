# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :text
#  max_occ     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  index_image :text
#

class House < ActiveRecord::Base
  belongs_to :bookings
end
