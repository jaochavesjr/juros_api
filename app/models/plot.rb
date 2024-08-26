class Plot < ApplicationRecord
  belongs_to :sale
  enum status: { open: 0, paid_off: 1, archived: 2 }
  after_update :create_plot

  private

  def create_plot
    plot = Plot.new(value: calc_percent, status: 0, payment_date: nil,
    number: new_number, sale: self.sale)
    plot.save
  end

  def new_number
    self.number + 1
  end

  def calc_percent
    (self.sale.fees/ 100) * self.sale.value
  end
end
