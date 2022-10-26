require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Usb', photo: 'https://media.giphy.com/media/8FNlmNPDTo2wE/giphy.gif', bio: 'You can do it man') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be a non-string value' do
    subject.posts_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an non-negative value' do
    subject.posts_counter = -11
    expect(subject).to_not be_valid
  end
end