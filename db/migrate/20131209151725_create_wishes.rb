class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.datetime :fromtime
      t.datetime :totime
      t.references :booking, index: true

      t.timestamps
    end
  end
end
