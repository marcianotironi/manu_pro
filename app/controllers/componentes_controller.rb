class ComponentesController < ApplicationController
    before_action :current_componente, only: [:show, :destroy, :edit]
    
    def index
        @componente = Componente.all
    end

    def show
        @componente = Componente.find(params[:id])
    end

    def edit        
    end

    def update
        current_componente
        @componente.update(componente_params)
        redirect_to equipamento_path(current_equipamento)
    end

    def create
        componente = current_componente
        equipamento = Equipamento.find_by_id(componente.equipamento_id)
        if componente.descricao? && equipamento != nil
            componente.save
            redirect_to equipamento_path(componente_params[:equipamento_id])
        else
            redirect_to root_path
        end
    end

    def destroy
        binding.pry
        componente = current_componente
        equipamento = current_componente
        componente = Componente.find(componente.id)
        componente.destroy
        redirect_to equipamento_path(equipamento.id)
    end

    private

    def componente_params
        params.require(:componente).permit(:descricao, :equipamento_id)
    end

    def current_componente
        binding.pry
        @componente = Componente.find(params[:id])    
    end

    def current_equipamento
        componente = current_componente
        @equipamento = Equipamento.find(componente.equipamento_id.to_i)
    end
end