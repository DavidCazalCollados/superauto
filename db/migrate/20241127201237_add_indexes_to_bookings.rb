class AddIndexesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_index :bookings, :car_id unless index_exists?(:bookings, :car_id)
    add_index :bookings, :user_id unless index_exists?(:bookings, :user_id)
    add_index :bookings, :status unless index_exists?(:bookings, :status)
    add_index :bookings, :start_date unless index_exists?(:bookings, :start_date)
    add_index :bookings, [:user_id, :car_id] unless index_exists?(:bookings, [:user_id, :car_id])
  end
end
