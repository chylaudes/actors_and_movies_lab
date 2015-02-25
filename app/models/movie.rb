class Movie < ActiveRecord::Base
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  validates :title, :year, presence: true
  validates :year, numericality: true
end
