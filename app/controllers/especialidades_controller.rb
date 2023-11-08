class EspecialidadesController < ApplicationController
    def index
        @especialidades = Especialidade.all
        render json: @especialidades
    end

    def show
        @especialidades = Especialidade.find(params[:id])
        render json: @especialidades
    end
end
