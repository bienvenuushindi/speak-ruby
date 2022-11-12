# Post Model
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter

  def recent_comments
    comments_desc.limit(5)
  end

  def comments_desc
    comments.order('created_at desc')
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
