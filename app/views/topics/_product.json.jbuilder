# frozen_string_literal: true

json.extract! product, :id, :created_at, :updated_at
json.url product_path(product, format: :json)
