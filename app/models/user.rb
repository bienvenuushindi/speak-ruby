# Model for User Entity
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, inverse_of: 'author', dependent: :destroy
  has_many :likes, inverse_of: 'author', dependent: :destroy
  has_many :comments, inverse_of: 'author', dependent: :destroy
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  after_create :skip_conf!
  def recent_posts
    posts_desc.limit(3)
  end

  def posts_desc
    posts.order(created_at: :desc)
  end

  def admin?
    role == 'admin'
  end

  def skip_conf!
    skip_confirmation! if Rails.env.development?
  end

end
