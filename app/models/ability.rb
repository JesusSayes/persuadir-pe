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
    end
  end
end
