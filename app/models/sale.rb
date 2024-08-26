class Sale < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :plots
  enum status: { open: 0, paid_off: 1, archived: 2 }
  after_create :create_plot

  private

  def create_plot
    Plot.create!(value: calc_percent, status: 0, payment_date: nil,
    number: 1, sale: self)
  end

  def calc_percent
    (self.fees/ 100) * self.value
  end
end
