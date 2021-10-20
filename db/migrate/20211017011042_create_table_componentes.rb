class CreateTableComponentes < ActiveRecord::Migration[6.1]
  def change
    create_table :componentes do |t|
      t.string   :descricao
      t.integer  :equipamento_id
      
      t.timestamps
    end
  end
end
