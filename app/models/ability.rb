class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Assuming User is your user model class

    # Only logged in users can manage categories and expenses
    return unless user.id.present?

    can :manage, Category, author_id: user.id
    can :manage, Expense, author_id: user.id
    can :update, Expense, author_id: user.id
  end
end
