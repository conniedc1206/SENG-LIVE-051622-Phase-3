class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.datetime :birthdate
      t.string :breed
    end
  end
end
