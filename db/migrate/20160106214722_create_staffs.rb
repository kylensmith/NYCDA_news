class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.string :job_title

      t.timestamps null: false
    end
  end
end
