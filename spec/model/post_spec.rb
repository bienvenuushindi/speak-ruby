require 'rails_helper'

RSpec.describe 'Post', type: :model do
  subject do
    Post.new(title: 'My Little Title', user_id: 1, text: 'Hello world, This my first rails app', comments_counter: 45,
             likes_counter: 14)
  end
  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'comments counter to be an integer grater than or equal to zero' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
  it 'comments counter to be a non-string value' do
    subject.comments_counter = 'abc'
    expect(subject).to_not be_valid
  end
  it 'comments counter to be a non-negative integer' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter to be an integer grater than or equal to zero' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid

    subject.likes_counter = 'abc'
    expect(subject).to_not be_valid

    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 255
    expect(subject).to_not be_valid
  end
end
