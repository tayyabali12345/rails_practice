# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :approvals, as: :approvable, dependent: :destroy

  validates :description, presence: true
end
