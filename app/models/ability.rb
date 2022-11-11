class Ability
  include CanCan::Ability

  def initialize(user)

    # Handle the case where we don't have a current_user i.e. the user is a guest
    # user ||= User.new
    if user.admin?
      can :manage, :all
    else
      # Define a few sample abilities
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can :manage, Like, author_id: user.id
      can :read, :all
    end
  end

end
