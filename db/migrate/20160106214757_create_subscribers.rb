class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
