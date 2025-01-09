require 'rails_helper'

RSpec.describe Plot, type: :model do
  let(:customer) { Customer.create(name: "Test Customer", cpf: "123456789") }
  let(:sale) { Sale.create(value: 100.0, fees: 10.0, due_date: Date.today, status: :open, customer: customer) }
  let(:plot) { Plot.create(value: 10.0, number: 1, status: :open, sale: sale) }

  describe '#update_plot' do
    it 'creates a new plot with updated attributes' do
      expect { plot.update(status: :paid_off) }.to change { Plot.count }.by(1)
      new_plot = Plot.last
      expect(new_plot.value).to eq(10.0)
      expect(new_plot.number).to eq(2)
      expect(new_plot.status).to eq('open')
    end
  end
end