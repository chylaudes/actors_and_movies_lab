class Comment < ActiveRecord::Base
  # validates :, presence: true
  belongs_to :commentable, polymorphic: true
end
