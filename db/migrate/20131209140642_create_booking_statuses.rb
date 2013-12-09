class CreateBookingStatuses < ActiveRecord::Migration
  def change
    create_table :booking_statuses do |t|
      t.string :name, limit: 100

      t.timestamps
    end
  end
end
