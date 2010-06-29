class CreateDbxrefs < ActiveRecord::Migration
  def self.up
    create_table :dbxrefs do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :dbxrefs
  end
end
