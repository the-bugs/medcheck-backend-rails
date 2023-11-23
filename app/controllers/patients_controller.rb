class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show update destroy ]

  # GET /patients
  def index
    @patients = Patient.all.map { |patient| {id:patient.id, usuarioId: patient.user_id, cpf: patient.cpf, sexo: patient.sex, dataNascimento: patient.dob,createdAt: patient.created_at, updatedAt: patient.updated_at} }

    render json: @patients
  end

  # GET /patients/1
  def show
    render json: {id:@patient.id, usuarioId: @patient.user_id, cpf: @patient.cpf, sexo: @patient.sex, dataNascimento: @patient.dob,createdAt: @patient.created_at, updatedAt: @patient.updated_at}
  end

  # POST /patients
  def create
    puts(@patient)
    @patient = Patient.new(user_id:params[:usuarioId], cpf:params[:cpf], sex:params[:sexo], dob:params[:dataNascimento])

    if @patient.save
      render json: {id:@patient.id, usuarioId: @patient.user_id, cpf: @patient.cpf, sexo: @patient.sex, dataNascimento: @patient.dob,createdAt: @patient.created_at, updatedAt: @patient.updated_at}, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(user_id:params[:usuarioId], cpf:params[:cpf], sex:params[:sexo], dob:params[:dataNascimento])
      render json: {id:@patient.id, usuarioId: @patient.user_id, cpf: @patient.cpf, sexo: @patient.sex, dataNascimento: @patient.dob,createdAt: @patient.created_at, updatedAt: @patient.updated_at}
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:user_id, :dob, :sex, :cpf)
    end
end
