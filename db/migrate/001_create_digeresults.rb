class CreateDigeresults < ActiveRecord::Migration
  def self.up
    create_table :digeresults do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :digeresults
  end
end
