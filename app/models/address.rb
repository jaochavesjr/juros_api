# frozen_string_literal: true

# model de Address
class Address < ApplicationRecord
  belongs_to :customer, inverse_of: :address
end
