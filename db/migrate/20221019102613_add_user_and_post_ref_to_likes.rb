# frozen_string_literal: true

# This a Migration to add foreign keys to Likes  table
class AddUserAndPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :post, foreign_key: true
  end
end
