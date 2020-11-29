class CreateShopBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_books do |t|
      t.bigint :book_id
      t.bigint :shop_id
      t.bigint :publisher_id
      t.bigint :copies_in_stock
      t.bigint :sold
    end
  end
end
