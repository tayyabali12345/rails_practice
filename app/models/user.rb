# frozen_string_literal: true

class User < ApplicationRecord

  has_many :topics, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one_attached :image

  has_many :user_topics, dependent: :destroy
  has_many :topics, through: :user_topics


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
