class WelcomeController < ApplicationController
  def index
    render ""
  end

  def shops
    @shops = Shop.find_by_sql("SELECT shops.id,name, shop_books.copies_in_stock , SUM(sold) as books_sold_count FROM shops JOIN shop_books ON shops.id = shop_books.shop_id WHERE publisher_id = '#{params[:id]}' GROUP BY shops.id ORDER BY books_sold_count DESC")
    @pub = Publisher.find(params[:id])
    @obj = {}
    @obj['shops'] = []
    @shops.each do |shop|
      shop['copies_in_stock'] = []
      shop.books.each do |book|
        if @pub.books.include?(book)
          result = ActiveRecord::Base.connection.execute("SELECT shop_books.copies_in_stock FROM shop_books JOIN books ON shop_books.book_id = books.id WHERE publisher_id = '#{params[:id]}' AND shop_id = '#{shop.id}' AND book_id = '#{book.id}' ")
          book['copies'] = result[0]['copies_in_stock']
          shop['copies_in_stock'] << book
        end
      end
      @obj['shops'] << shop
    end
    render json: @obj
  end

  def sold_copies
    @book = ShopBook.where("shop_id = ? AND book_id = ?", params[:shop_id], params[:book_id])[0]

    if @book
      if @book['copies_in_stock'] > 0 && @book['copies_in_stock'] >= params[:num].to_i
       @book['copies_in_stock'] -= params[:num].to_i
       @book['sold'] += params[:num].to_i
       @book.save
       render json: @book
     else
      render status: 500
     end
     else
      render status: 500
    end

 end

end

