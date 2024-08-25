# frozen_string_literal: true

# controller do Customer
class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit]
  def new
    @customer = Customer.new
    @customer.build_address
  end

  def index
    @customer = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer.to_json(include: :address), status: :created
    else
      render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      render json: @customer.to_json(include: :address), status: :ok
    else
      render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def show
    render json: @customer, status: :ok
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :cpf, :birthday, :telephone, :nickname,
                                      address_attributes:
                                      %i[
                                        street number neighborhood city state cep complement
                                      ])
  end
end
