class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all

    render json: @users, include: [:patient, :medic]
  end

  # GET /users/1
  def show
    render json: @user, include: [:patient => {:include => :record}]
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(
       :name, :email, :password, :user_type
      )
    end
end
