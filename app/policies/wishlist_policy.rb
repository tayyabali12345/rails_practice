# frozen_string_literal: true

class WishlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user != @record.wishlist_products.first.product.user
  end

  def edit?
    @user != @record.user
  end

  def update?
    edit?
  end

  def destroy?
    @user != @record.user
  end
end
