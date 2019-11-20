class CreateAllTables < ActiveRecord::Migration[5.2]

  def change

    create_table :users do |t|
      t.string :name
    end

    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :rating
    end

    create_table :user_restaurants do |t|
      t.integer :user_id
      t.integer :restaurant_id
    end

  end

end
