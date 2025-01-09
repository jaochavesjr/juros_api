class Plot < ApplicationRecord
  belongs_to :sale
  enum status: { open: 0, paid_off: 1, archived: 2 }
  after_update :create_new_plot, if: :paid_off?

  private

  def create_new_plot
    Plot.create!(value: calc_percent, status: :open, payment_date: Date.current,
                 number: new_number, sale: self.sale)
  end

  def paid_off?
    saved_change_to_status? && paid_off?
  end

  def new_number
    self.number + 1
  end

  def calc_percent
    (self.sale.fees/ 100) * self.sale.value
  end
end
