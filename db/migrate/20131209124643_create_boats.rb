class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name, limit: 100

      t.timestamps
    end
  end
end
