class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      can [:read, :create], Excerpt
      can :manage, Excerpt, :user_id => user.id
      can [:update, :read], User do | u |
        u.id == user.id
      end
    end
  end
end
