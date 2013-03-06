class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    else
      can :manage, User, :id => user.id
      can :read, Page
      can :read, Consultant
      can :read, Notice
      can :read, Workshop
      cannot :index, Page
      cannot :index, User
      cannot :index, EventDate
      cannot :index, Image
      cannot :index, Notice
      cannot :index, Workshop
      cannot [:index, :create], User
    end
  end
end
