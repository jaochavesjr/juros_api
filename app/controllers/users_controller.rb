# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @users = User.all
    render json: @users, status: :ok
  end
end
