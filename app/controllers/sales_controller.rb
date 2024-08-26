# frozen_string_literal: true

# controller do Sale
class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit]
  def new
    @sale = Sale.new
  end

  def index
    @sales = Sale.all
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      render json: @sale.to_json(include: :plots), status: :created
    else
      render json: { errors: @sale.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sale.update(sale_params)
      render json: @sale, status: :ok
    else
      render json: { errors: @sale.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def show
    render json: @sale, status: :ok
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:value, :fees, :due_date, :status, :customer_id)
  end
end
