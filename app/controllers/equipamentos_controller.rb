class EquipamentosController < ApplicationController
    before_action :current_equipamento, only: [:show, :destroy]

    def index
        @equipamentos = Equipamento.all
    end

    def show
        @equipamento = Equipamento.find(params[:id])
        @componentes = Componente.where(equipamento_id: params[:id])
    end

    def create
        equipamento = Equipamento.new(equipamento_params)
        if equipamento.descricao?
            equipamento.save
        end
        redirect_to root_path
    end

    def edit
    end

    def update
        @equipamento.update_attibutes(:descricao, equipamento_params)
        binding.pry
        redirect_to equipamento_path(@equipamento)

    end

    def destroy 
        @equipamento.destroy
        redirect_to root_path
    end

    private

    def equipamento_params
        params.require(:equipamento).permit(:descricao)
    end

    def current_equipamento
        @equipamento = Equipamento.find(params[:id])    
    end
  
end