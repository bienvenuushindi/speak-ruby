# Model for User Entity
class User < ApplicationRecord
  has_many :posts, inverse_of: 'author'
  has_many :likes, inverse_of: 'author'
  has_many :comments, inverse_of: 'author'
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  def recent_posts
    posts_desc.limit(5)
  end

  def posts_desc
    posts.order(created_at: :desc)
  end
end
