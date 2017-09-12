class CreateClients < ActiveRecord::Migration[5.1]
  def change

    create_table :client do |t|
        t.text :name
        t.text :phone
        t.text :datestamp
        t.text :barber
        t.text :color

        #автоматом создает два столбца created_at(дата создания сущности), update_at(дата изменения)
        t.timestamps
    end
  end
end
