class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :captain, index: true
      t.references :guide, index: true
      t.references :boat, index: true
      t.references :tour, index: true
      t.string :customer_name, limit: 50
      t.string :customer_email, limit: 50
      t.references :booking_status, index: true
      t.text :contact_info
      t.text :notes

      t.timestamps
    end
    add_index :bookings, :customer_name
    add_index :bookings, :customer_email
  end
end
