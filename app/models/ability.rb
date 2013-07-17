class Ability

  include CanCan::Ability

  def initialize(user)
          user ||= User.new
             if user
                if user.has_role? :admin
                      can :manage, :all  
                else
                can :manage, :all
             end     
             else
                   can :read, :all
             end
  end
end
