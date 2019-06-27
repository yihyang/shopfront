class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :product_type
      t.string :name
      t.string :slug
      t.jsonb :numbers, null: false, default: '{}'
      t.jsonb :strings, null: false, default: '{}'

      t.timestamps
    end

    add_index :products, :numbers, using: :gin
    add_index :products, :strings, using: :gin
  end
end
