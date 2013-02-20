class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    else
      can :manage, User, :id => user.id
      can :read, Article
      cannot :index, Article
      cannot :index, User
    end
  end
end
