class Plot < ApplicationRecord
  belongs_to :sale
  enum :status, [:open, :paid_off, :archived]

  def create_new_plot
    return if self.paid_off? || self.sale.plots.where(number: new_number).exists? || self.status != "open" || self.sale.plots.count >= 1

    Plot.create!(value: calc_percent, status: :open, payment_date: Date.current,
                 number: new_number, sale: self.sale)
  end

  private

  def paid_off?
    saved_change_to_status? && status == "paid_off"
  end

  def new_number
    self.number + 1
  end

  def calc_percent
    (self.sale.fees/ 100) * self.sale.value
  end
end
