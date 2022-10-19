# This a Migration to add foreign keys to Posts  table
class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
