require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:customer) { Customer.create(name: "Test Customer", cpf: "123456789", telephone: "123456789", nickname: "Test", birthday: Date.today) }
  let(:sale) { Sale.create(value: 100.0, fees: 10.0, due_date: Date.today, status: :open, customer: customer) }

  describe 'associations' do
    it { should belong_to(:customer).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:due_date) }
    it { should define_enum_for(:status).with_values([:open, :paid_off, :archived]) }
  end

  describe '#create_initial_plot' do
    it 'creates a plot associated with the sale' do
      expect { sale.create_initial_plot }.to change { Plot.count }.by(1)
    end
  end

  describe '#calc_percent' do
    it 'calculates the correct percentage' do
      expect(sale.calc_percent).to eq((sale.fees / 100) * sale.value)
    end
  end
end
