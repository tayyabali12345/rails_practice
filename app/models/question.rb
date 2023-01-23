# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  has_many :topic_questions, dependent: :destroy
  has_many :topics, through: :topic_questions
  has_many :answers, dependent: :destroy

  validates :subject, :description, presence: true
end
