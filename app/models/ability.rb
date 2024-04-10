# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Common actions
    # here are :read, :create, :update and :destroy.

    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    if user.has_any_role? :admin, :manager
      can :manage, :all
    else
      can :read, :all
    end
  end
end
