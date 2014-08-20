class UpdateColumnAddNoteToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :note, :text
  end
end
