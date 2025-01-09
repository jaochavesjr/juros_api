class Plot < ApplicationRecord
  belongs_to :sale
  enum :status, [ :open, :paid_off, :archived ]

  def create_new_plot
    return if self.paid_off? || self.sale.plots.where(number: new_number).exists? || self.status != "open"

    Plot.create!(value: calc_percent, status: :open, payment_date: Date.current,
                 number: new_number, sale: self.sale)
  end

  def create_plot
    # implementation
  end

  def calc_percent
    # implementation
  end

  private
end
