class CreateBarbers < ActiveRecord::Migration[5.1]
  def change
        create_table :barbers do |t|
        t.text :name

        #автоматом создает два столбца created_at(дата создания сущности), update_at(дата изменения)
        t.timestamps
    end

    #наполняем таблицу
    Barber.create :name => 'Jessie Pinkman'
    Barber.create :name => 'Walter White'
    Barber.create :name => 'Gus Fring'

  end
end
