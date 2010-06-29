class CreateIngenuityresults < ActiveRecord::Migration
  def self.up
    create_table :ingenuityresults do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :ingenuityresults
  end
end
