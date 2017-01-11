class AddNewsfeedToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :newsfeed, :string
  end
end
