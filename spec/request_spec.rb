require 'rails_helper'
RSpec.describe 'UsersController', :type => :request do
  describe 'get#index' do
    before(:example) do
      get '/users'
    end

    it 'response status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render the list of users' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('USERS')
    end
  end
  describe 'get#show' do
    before(:example) do
      user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
      get "/users/#{user.id}"
    end

    it 'response status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render the list of users' do
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('Teacher from Poland')
    end
  end
end

RSpec.describe 'PostsController', :type => :request do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack Developer.', posts_counter: 0) }
  describe 'get#index' do
    before(:example) do
      get "/users/#{subject.id}/posts"
    end

    it 'response status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render the list of users' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('Pagination')
    end
  end
  describe 'get#show' do
    before(:example) do
      first_post = Post.create(author: subject, title: 'Hello', text: 'This is my first post',likes_counter: 0,
                                   comments_counter: 0)
      get "/users/#{subject.id}/posts/#{first_post.id}"
    end

    it 'response status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render the list of users' do
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('This is my first post')
    end
  end
end
