class RemoveColumns < ActiveRecord::Migration[5.0]
  def self.up
  remove_column :genres, :type
  end

  def self.down
  add_column :genres, :type, :type
  end

end
