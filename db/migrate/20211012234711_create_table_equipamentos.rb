class CreateTableEquipamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :equipamentos do |t|
      t.string :descricao
       
      t.timestamps
    end
  end
end
