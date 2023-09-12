class UsersController < ApplicationController
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city: params[:city],
      zipcode: params[:zipcode],
    )

    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  #fix this
  def update
    user = current_user
    user.update(
      first_name: params[:first_name] || user.first_name,
      last_name: params[:last_name] || user.last_name,
      city: params[:city] || user.city,
      state: params[:state] || user.state,
    )
    render json: { message: "User updated" }
  end
end
