class Equipamento < ApplicationRecord
    has_many :componentes, dependent: :destroy
end