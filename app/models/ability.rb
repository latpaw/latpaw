class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    cannot :access,:home
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :writer
      can :read, :all
      can :create, Post
      can :manage, Post do |post|
         (post.userid == user.id)
      end
      can :add_tag, Post
      can :create, Command
    else
      can :read, Post
      cannot :remove, Post
      cannot :destory, Comment
      cannot :create, Command
      cannot :destroy, Command
    end

  end
end
