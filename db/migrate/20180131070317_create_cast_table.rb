class CreateCastTable < ActiveRecord::Migration[5.1]
  def self.up
     create_table :casts, :id => false do |t|
       t.integer :movie_id
       t.integer :actor_id
     end
  end
  def self.down
     drop_table :casts
  end
end
