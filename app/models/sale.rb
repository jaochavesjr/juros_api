class Sale < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :plots
  enum status: { open: 0, paid_off: 1, archived: 2 }
  validates :value, presence: true
  validates :due_date, presence: true
  after_create :create_initial_plot

  public

  def create_initial_plot
    return if plots.exists?(number: 1)

    Plot.create!(value: calc_percent, status: 0, payment_date: nil,
                 number: 1, sale: self)
  end

  def calc_percent
    (self.fees/ 100) * self.value
  end
end
