require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  describe 'index page' do
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
      visit user_posts_path(@user)
    end
    # I can see the user's profile picture.
    it 'should show user\'s profile picture ' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    # I can see the user's username.
    it 'should show user\'s username' do
      expect(page).to have_content(@user.name)
    end

    #   I can see the number of posts the user has written.
    it 'should show the number of posts the user has written' do
      expect(page).to have_content(@user.posts_counter)
    end

    #     I can see the user's bio.
    it 'should show  the user\'s bio' do
      expect(page).to have_content(@user.bio)
    end
    #   I can see a post's title.
    scenario 'should show a post\'s title' do
      expect(page).to have_content(@my_post.title)
    end
    #   I can see some of the post's body.
    scenario 'should show a post\'s body' do
      expect(page).to have_content(@my_post.text)
    end
    #   I can see the first comments on a post.
    scenario 'should show the first comments on a post' do
      expect(page).to have_content('My first comment')
    end
    #     I can see how many comments a post has.
    scenario 'should show how many comments a post has' do
      expect(page).to have_content(@my_post.comments_counter)
    end
    #   I can see how many likes a post has.
    scenario 'should show how many likes a post has' do
      expect(page).to have_content(@my_post.likes_counter)
    end
    # I can see a section for pagination if there are more posts than fit on the view.
    scenario 'should show a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_button('Pagination')
    end
    # When I click on a post, it redirects me to that post's show page.
    it 'should redirect me to that post\'s show page When I click on view\'s post' do
      click_link('View Post', match: :first)
      expect(page).to have_content('POST DETAILS')
    end
  end
end
