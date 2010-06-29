class CreateLcmsresults < ActiveRecord::Migration
  def self.up
    create_table :lcmsresults do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :lcmsresults
  end
end
