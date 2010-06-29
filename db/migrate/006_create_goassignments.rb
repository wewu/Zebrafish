class CreateGoassignments < ActiveRecord::Migration
  def self.up
    create_table :goassignments do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :goassignments
  end
end
