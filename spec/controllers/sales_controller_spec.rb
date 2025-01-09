require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  let(:customer) { Customer.create(name: "Test Customer", cpf: "123456789") }
  let(:sale) { Sale.create(value: 100.0, fees: 10.0, due_date: Date.today, status: :open, customer: customer) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: sale.to_param }
      expect(response).to be_successful
    end
  end
end
