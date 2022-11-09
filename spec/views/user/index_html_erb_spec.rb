require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://i.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA',
                          bio: 'Teacher from Poland.', posts_counter: 0)
      visit users_path
    end

    scenario 'I can see the names of all users' do
      expect(page).to have_content(@user.name)
    end

    scenario 'I can see the number of posts for each user' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "I can see the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it "I can see the user's page" do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
