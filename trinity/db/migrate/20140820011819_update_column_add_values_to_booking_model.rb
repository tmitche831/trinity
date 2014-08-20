class UpdateColumnAddValuesToBookingModel < ActiveRecord::Migration
  def change
    add_column :bookings, :house_id, :integer
    add_column :bookings, :date_from, :date
    add_column :bookings, :date_to, :date
  end
end
