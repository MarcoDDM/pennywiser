# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Define abilities here based on user roles, e.g., admin or regular user
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      # Add more permissions as needed
    end
  end
end
