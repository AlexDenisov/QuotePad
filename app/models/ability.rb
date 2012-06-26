class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :vote_up, :vote_down => :rate

    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      can [:read, :create, :rate], Excerpt
      can :manage, Excerpt, :user_id => user.id
      can :read, User
      can [:update], User do | u |
        u.id == user.id
      end
    end
  end
end
