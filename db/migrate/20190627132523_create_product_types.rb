class CreateProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_types do |t|
      t.string :name
      t.string :slug
      t.jsonb :numbers, null: false, default: '{}'
      t.jsonb :strings, null: false, default: '{}'

      t.timestamps
    end

    add_index :product_types, :numbers, using: :gin
    add_index :product_types, :strings, using: :gin
  end
end
