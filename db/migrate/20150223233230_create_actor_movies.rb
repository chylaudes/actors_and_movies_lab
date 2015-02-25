class CreateActorMovies < ActiveRecord::Migration
  def change
    create_table :actor_movies do |t|
      t.string :actor_id
      t.string :integer
      t.integer :movie_id

      t.timestamps
    end
  end
end
