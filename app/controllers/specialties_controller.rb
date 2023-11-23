class SpecialtiesController < ApplicationController
  before_action :authorize_request, only: %i[update destroy]
  before_action :set_specialty, only: %i[ show update destroy ]
  before_action :permit_request, only: %i[ ]

  # GET /specialties
  def index
    @specialties = Specialty.all.map { |specialty| {id:specialty.id,nome: specialty.name, createdAt: specialty.created_at, updatedAt: specialty.updated_at} }

    render json: @specialties
  end

  # GET /specialties/1
  def show
    render json: {id:@specialty.id, nome: @specialty.name, createdAt: @specialty.created_at, updatedAt: @specialty.updated_at}
  end

  # POST /specialties
  def create
    @specialty = Specialty.new(name:params[:nome])

    
    if @specialty.save 
      puts(@specialty) 
      render json: {id:@specialty.id, nome: @specialty.name, createdAt: @specialty.created_at, updatedAt: @specialty.updated_at}, status: :created, location: @specialty
    else
      render json: @specialty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specialties/1
  def update
    if @specialty.update(name:params[:nome])
      puts(@specialty)
      render json: {nome:@specialty.name}
    else
      render json: @specialty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specialties/1
  def destroy
    @specialty.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialty
      @specialty = Specialty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specialty_params
      params.permit(:nome)
    end
end
