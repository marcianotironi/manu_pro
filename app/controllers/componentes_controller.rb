class ComponentesController < ApplicationController
    def index
        @componente = Componente.all
    end

    def show
        @componente = Componente.find(params[:id])
    end

    def create
        componente = Componente.new(post_params)
        equipamento = Equipamento.find_by_id(componente.equipamento_id)
        if componente.descricao? && equipamento != nil
            componente.save
            redirect_to equipamento_path(post_params[:equipamento_id])
        else
            redirect_to root_path
        end
    end

    def destroy 
        componente = Componente.find(params[:id])
        componente.destroy
        redirect_to root_path
    end

    private

    def post_params
        params.require(:componente).permit(:descricao, :equipamento_id)
    end
  
end