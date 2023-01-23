# frozen_string_literal: true

class TopicQuestion < ApplicationRecord
  belongs_to :topic
  belongs_to :question
end
