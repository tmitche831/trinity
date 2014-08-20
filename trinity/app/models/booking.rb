# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  guests     :integer
#  created_at :datetime
#  updated_at :datetime
#  house_id   :integer
#  date_from  :date
#  date_to    :date
#

class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :houses
end
