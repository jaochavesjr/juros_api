# frozen_string_literal: true

class PlotsController < ApplicationController
  before_action :set_plots, only: %i[edit update]
  def edit; end

  def update
    if @plot.update(status: :paid_off, payment_date: Date.current)
      render json: @plot, status: :ok
    else
      render json: { errors: @plot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_plots
    @plot = Plot.find(params[:id])
  end
end
