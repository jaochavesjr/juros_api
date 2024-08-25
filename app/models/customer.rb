class Customer < ApplicationRecord
  has_one :address, dependent: :destroy, inverse_of: :customer

  accepts_nested_attributes_for :address
  validates :name, :cpf, presence: true
end
