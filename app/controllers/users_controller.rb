class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all.map {|user| {user_id: user.id, nome: user.name, email: user.email, tipo: user.user_type,createdAt: user.created_at, updatedAt: user.updated_at}}

    render json: @users
  end

  # GET /users/1
  def show
    render json: {user_id: @user.id, nome: @user.name, email: @user.email, tipo: @user.user_type,createdAt: @user.created_at, updatedAt: @user.updated_at}
  end

  # POST /users
  def create

    puts(@record) 
    @user = User.new(name:params[:nome], email:params[:email], user_type:params[:tipo], password:params[:password])

    if @user.save
      render json: {user_id: @user.id, nome: @user.name, email: @user.email, tipo: @user.user_type,createdAt: @user.created_at, updatedAt: @user.updated_at}, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(name:params[:nome], email:params[:email], user_type:params[:tipo])
      render json: {user_id: @user.id, nome: @user.name, email: @user.email, tipo: @user.user_type,createdAt: @user.created_at, updatedAt: @user.updated_at}
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
       :nome, :email, :password, :tipo
      )
    end
end
