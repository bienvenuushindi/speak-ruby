require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://i.picsum.photos/id/27/3264/1836.jpg?hmac=p3BVIgKKQpHhfGRRCbsi2MCAzw8mWBCayBsKxxtWO8g',
                          bio: 'Teacher from Mexico.', posts_counter: 12)
      @user.posts.create(title: '1 Fuga Ea sint dolor', text: 'Necessitatibus adipi', likes_counter: 6,
                         comments_counter: 6)
      @user.posts.create(title: '2 Quod nesciunt et eu', text: 'Explicabo Eaque off', likes_counter: 0,
                         comments_counter: 0)
      @user.posts.create(title: '3 Ullamco laboriosam', text: 'Asperiores dolorem i', likes_counter: 11,
                         comments_counter: 0)
      @user.posts.create(title: '4 Ullamco laboriosam', text: 'Asperiores dolorem i', likes_counter: 11,
                         comments_counter: 0)
      visit user_path(@user)
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

    # I can see the user's first 3 posts.
    it 'should show  the user\'s first 3 posts' do
      expect(page).to have_no_text('1 Fuga Ea sint dolor')
      expect(page).to have_text('2 Quod nesciunt et eu')
    end

    #   I can see a button that lets me view all of a user's posts.
    it 'should show see all posts button' do
      expect(page).to have_button('See All Posts')
    end

    # When I click a user's post, it redirects me to that post's show page.
    it 'should redirect me to that post\'s show page When I click a view\'s post' do
      click_link('View Post', match: :first)
      expect(page).to have_content('POST DETAILS')
    end

    # When I click to see all posts, it redirects me to the user's post's index page.
    it 'should redirect me to the user\'s post\'s index page When I click to see all posts' do
      click_link('See All Posts')
      expect(page).to have_current_path(user_posts_path(@user.id))
    end
  end
end
