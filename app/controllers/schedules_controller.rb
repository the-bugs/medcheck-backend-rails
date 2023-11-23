class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show update destroy ]

  # GET /schedules
  def index
    @schedules = Schedule.all.map { |schedule| {id:schedule.id, idMedico: schedule.medic_id,dataAgenda: schedule.date, updatedAt: schedule.updated_at} }

    render json: @schedules
  end

  # GET /schedules/1
  def show
    render json: {id:@schedule.id, idMedico: @schedule.medic_id,dataAgenda: @schedule.date, updatedAt: @schedule.updated_at}
  end

  # GET /agendas/medicos/id
  def schedules_by_medics
    @schedules = Schedule.where(medic_id: params[:id]).map { 
      |schedule| {
        id: schedule.id, 
        dataAgenda: schedule.date,      
        createdAt: schedule.created_at, updatedAt: schedule.updated_at
      }
    }
    render json: @schedules
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(date:params[:dataAgenda], medic_id:params[:idMedico])

    if @schedule.save
      puts(@schedule) 

      render json: {dataAgenda:@schedule.date}, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(date:params[:dataAgenda], medic_id:params[:idMedico])
      puts(@schedule) 
      render json: {dataAgenda:@schedule.date}
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.permit(:dataAgenda, idMedico)
      params.require(:schedule).permit(:medic_id, :date)
    end
end
