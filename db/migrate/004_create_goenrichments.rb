class CreateGoenrichments < ActiveRecord::Migration
  def self.up
    create_table :goenrichments do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :goenrichments
  end
end
