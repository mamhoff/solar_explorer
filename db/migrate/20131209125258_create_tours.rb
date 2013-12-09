class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name, limit: 100

      t.timestamps
    end
  end
end
