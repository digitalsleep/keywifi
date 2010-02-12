class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :name ,:string
      t.column :username,:string
      t.column :password,:string
      t.column  :address,:string
      t.column  :neighbourhood,:string
      t.column :city,:string
      t.column :state,:string
      t.column :zipcode,:string
      t.column :phone,:string
      t.column :user_type,:string
      t.column :user_to_do,:string
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
