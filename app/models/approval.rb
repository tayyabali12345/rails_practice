# frozen_string_literal: true

class Approval < ApplicationRecord
  belongs_to :approvable, polymorphic: true
  belongs_to :user
end
