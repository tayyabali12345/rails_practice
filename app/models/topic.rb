class Topic < ApplicationRecord
  has_one_attached :image
  has_many :topic_questions, dependent: :destroy
  has_many :questions, through: :topic_questions

  has_many :user_topics, dependent: :destroy
  has_many :users, through: :user_topics
  belongs_to :user
end
