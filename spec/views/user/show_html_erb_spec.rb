require 'rails_helper'

describe 'User', type: :system, js: true do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://i.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA',
                          bio: 'Teacher from Poland.', posts_counter: 0)
      visit user_path(@user.id)
    end
    # I can see the user's profile picture.
    it 'should show user\'s profile picture ' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    # I can see the user's username.
    it 'should show user\'s username' do
      expect(page).to have_content("#{@user.name}jina")
    end
    #   I can see the number of posts the user has written.
    #     I can see the user's bio.
    # I can see the user's first 3 posts.
    #   I can see a button that lets me view all of a user's posts.
    # When I click a user's post, it redirects me to that post's show page.
    # When I click to see all posts, it redirects me to the user's post's index page.

  end
end
