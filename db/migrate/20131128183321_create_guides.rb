class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name
      t.string :email
      t.string :password_token

      t.timestamps
    end
  end
end
