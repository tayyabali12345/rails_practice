# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @record.product.user != @user && !@user.nil?
  end

  def edit?
    update?
  end

  def update?
    @user == @record.user
  end
end
