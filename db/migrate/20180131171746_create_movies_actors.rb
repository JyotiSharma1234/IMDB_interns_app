class CreateMoviesActors < ActiveRecord::Migration[5.1]
  def self.up
     create_table :actors_movies, :id => false do |t|
       t.integer :movie_id
       t.integer :actor_id
     end
  end
  def self.down
     drop_table :actors_movies
  end
end
