class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # Confirmable
    end
  end
end
