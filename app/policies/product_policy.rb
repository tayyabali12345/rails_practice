# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @user == @record.user
  end

  def update?
    edit?
  end

  def destroy?
    @user == @record.user
  end
end
