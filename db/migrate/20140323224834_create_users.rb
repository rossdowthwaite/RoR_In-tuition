class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :title
      t.string :username
      t.string :email
      t.date :dob
      t.attachment :avatar
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer   :login_count
      t.integer   :failed_login_count
      t.datetime  :last_login_at
      
      t.timestamps
    end
  end
end