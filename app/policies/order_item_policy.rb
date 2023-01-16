# frozen_string_literal: true

class OrderItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @record.product.user != @user
  end
end
