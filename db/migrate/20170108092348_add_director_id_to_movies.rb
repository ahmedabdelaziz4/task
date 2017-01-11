class AddDirectorIdToMovies < ActiveRecord::Migration[5.0]
  def change
  	add_column :movies, :director_id, :integer
    add_index  :movies, :director_id
  end
end
