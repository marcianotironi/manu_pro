class ComponentesController < ApplicationController
    before_action :current_componente, only: [:show, :destroy, :edit, :update]
    
    def index
        @componente = Componente.all
    end

    def show
        @componente = Componente.find(params[:id])
    end

    def edit        
    end

    def update
        @componente.update(componente_params)
        redirect_to equipamento_path(current_equipamento)
    end

    def create
        componente = Componente.new(componente_params)
        if componente.save
            redirect_to equipamento_path(componente_params[:equipamento_id])
        else
            redirect_to root_path
        end
    end

    def destroy
        componente = current_componente
        equipamento = current_equipamento
        if componente.destroy
            redirect_to equipamento_path(equipamento.id)
        end

    end

    private

    def componente_params
        params.require(:componente).permit(:descricao, :equipamento_id)
    end

    def current_componente
        @componente = Componente.find(params[:id])    
    end

    def current_equipamento
        componente = current_componente
        @equipamento = Equipamento.find(componente.equipamento_id.to_i)
    end
end