require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://i.picsum.photos/id/27/3264/1836.jpg?hmac=p3BVIgKKQpHhfGRRCbsi2MCAzw8mWBCayBsKxxtWO8g',
                          bio: 'Teacher from Mexico.', posts_counter: 12)
      @my_post = @user.posts.create(title: '1 Fuga Ea sint dolor', text: 'Necessitatibus adipi', likes_counter: 6,
                                    comments_counter: 0)
      @my_post.comments.create(text: 'My first comment', author: @user)
      @my_post.comments.create(text: 'My Second comment', author: @user)
      @my_post.comments.create(text: 'My third comment', author: @user)
      @my_post.comments.create(text: 'My fourth comment', author: @user)
      @my_post.comments.create(text: 'My fifth comment', author: @user)
      visit single_post_path(@user, @my_post)
    end
    # I can see the post's title.
    it 'should show the post\'s title' do
      expect(page).to have_content(@my_post.title)
    end
    #   I can see who wrote the post.
    it 'should show the author of the post' do
      expect(page).to have_content(@my_post.author.name)
    end
    #   I can see how many comments it has.
    it 'should show how many comments a post has' do
      expect(page).to have_content(@my_post.comments_counter)
    end
    #   I can see how many likes it has.
    it 'should show how many likes a post has' do
      expect(page).to have_content(@my_post.likes_counter)
    end
    #   I can see the post body.
    it 'should show the post body' do
      expect(page).to have_content(@my_post.text)
    end
    # I can see the comment each commentor left.(a-laarabi)

    # I can see the username of each commentor.(michael)
    it ' I can see the username of each commentor' do
      expect(page).to have_content(@my_post.comments.first.author.name)
    end
  end
end
