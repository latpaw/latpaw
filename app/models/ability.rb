class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      # not logged in
      cannot :manage, :all

    end

  end
end
