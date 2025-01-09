require 'rails_helper'

RSpec.describe Plot, type: :model do
  let(:customer) { Customer.create(name: "Test Customer", cpf: "123456789") }
  let(:sale) { Sale.create(value: 100.0, fees: 10.0, due_date: Date.today, status: :open, customer: customer) }
  let(:plot) { Plot.create(value: 10.0, number: 1, status: :open, sale: sale) }

  describe '#create_new_plot' do
    it 'creates a new plot with updated attributes' do
      Plot.skip_callback(:update, :after, :create_new_plot)
      expect { plot.create_new_plot }.to change { Plot.count }.by(1)
      Plot.set_callback(:update, :after, :create_new_plot)
      new_plot = Plot.last
      expect(new_plot.value).to eq(plot.calc_percent)
      expect(new_plot.number).to eq(plot.number + 1)
      expect(new_plot.status).to eq('open')
      expect(new_plot.sale).to eq(plot.sale)
      expect(new_plot.payment_date).to eq(Date.current)
    end
  end
end
