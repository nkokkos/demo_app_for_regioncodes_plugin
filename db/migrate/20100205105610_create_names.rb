class CreateNames < ActiveRecord::Migration
  def self.up
    create_table :names do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :geographical_region
      t.string :department
      t.string :municipality
      t.string :admin_district
      t.string :commune

      t.timestamps
    end
  end

  def self.down
    drop_table :names
  end
end
