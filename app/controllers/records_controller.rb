class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show update destroy ]

  # GET /records
  def index
    @records = Record.all.map { |record| {id:record.id, pacienteId: record.patient.id, descricao: record.description, createdAt: record.created_at, updatedAt: record.updated_at} }

    render json: @records
  end

  # GET /records/1
  def show
    render json: {id:@record.id, pacienteId: @record.patient_id, descricao: @record.description, createdAt: @record.created_at, updatedAt: @record.updated_at}
  end

  # POST /records
  def create
    puts(@record) 
    @record = Record.new(description:params[:descricao], patient_id:params[:idPaciente])

    if @record.save
      render json: {id:@record.id, pacienteId: @record.patient_id, descricao: @record.description, createdAt: @record.created_at, updatedAt: @record.updated_at}, status: :created, location: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    @record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_params
      params.permit(:descricao,:idPaciente)
      params.require(:record).permit(:patient_id, :description)
    end
end
