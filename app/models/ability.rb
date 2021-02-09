# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all if permission(user, 'all')

    # # Client - all
    # can :manage, Client if permission(user, 'all.client.all')
    # can :read  , Client if permission(user, 'all.client.all.read')
    # can :create, Client if permission(user, 'all.client.all.create')
    # can :edit  , Client if permission(user, 'all.client.all.update')
    # can :delete, Client if permission(user, 'all.client.all.delete')

    # # Coupon - all
    # can :manage, Coupon if permission(user, 'all.coupon.all')
    # can :read  , Coupon if permission(user, 'all.coupon.all.read')
    # can :create, Coupon if permission(user, 'all.coupon.all.create')
    # can :edit  , Coupon if permission(user, 'all.coupon.all.update')
    # can :delete, Coupon if permission(user, 'all.coupon.all.delete')

    # # Invoice - all
    # can :manage, Invoice if permission(user, 'all.invoice.all')
    # can :read  , Invoice if permission(user, 'all.invoice.all.read')
    # can :create, Invoice if permission(user, 'all.invoice.all.create')
    # can :edit  , Invoice if permission(user, 'all.invoice.all.update')
    # can :delete, Invoice if permission(user, 'all.invoice.all.delete')

    # # Product - all
    # can :manage, Product if permission(user, 'all.product.all')
    # can :read  , Product if permission(user, 'all.product.all.read')
    # can :create, Product if permission(user, 'all.product.all.create')
    # can :edit  , Product if permission(user, 'all.product.all.update')
    # can :delete, Product if permission(user, 'all.product.all.delete')

    # # User - all
    # can :manage, User if permission(user, 'all.user.all')
    # can :read  , User if permission(user, 'all.user.all.read')
    # can :create, User if permission(user, 'all.user.all.create')
    # can :edit  , User if permission(user, 'all.user.all.update')
    # can :delete, User if permission(user, 'all.user.all.delete')

    # # User - owner
    # can :manage, User, user.id == :id if permission(user, 'all.user.owner')
    # can :read  , User, user.id == :id if permission(user, 'all.user.owner.read')
    # can :create, User, user.id == :id if permission(user, 'all.user.owner.create')
    # can :edit  , User, user.id == :id if permission(user, 'all.user.owner.update')
    # can :delete, User, user.id == :id if permission(user, 'all.user.owner.delete')
  end

  private

  def permission(user, name)
    user.roles.any? do |role|
      role.role_permissions.where(permission: name).count.positive?
    end
  end
end
