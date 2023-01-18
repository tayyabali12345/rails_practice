# frozen_string_literal: true

class User < ApplicationRecord

  has_many :topics, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :user_topics, dependent: :destroy
  has_many :topics, through: :user_topics
  has_one_attached :image

  validates :image,
  content_type: %i[gif png jpg jpeg],
  size: { less_than: 1.megabytes, message: 'The size of image should be less than less_than: 1.megabytes'}
  validates :first_name, :last_name, :age, :gender, presence: true
  validates :age, numericality: { only_integer: true , greater_than: 0, max: 100}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
