class Componente < ApplicationRecord
    belongs_to :equipamento, class_name: "Equipamento", foreign_key: :equipamento_id
end