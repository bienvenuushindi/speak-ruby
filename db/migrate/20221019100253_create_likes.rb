# frozen_string_literal: true

# This a Migration for Likes table
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
  end
end
