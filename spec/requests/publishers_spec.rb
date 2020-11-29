require 'rails_helper'

RSpec.describe "Publishers", type: :request do
    it "get publisher by id" do
      get ("/publisher/1")
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
    end


  	it "post /shop " do
  		post "/shop" , :params => { :shop_id => 3, :book_id => 1, :num => 1 }
  		expect(response.content_type).to eq("application/json; charset=utf-8")
       expect(response).to have_http_status(200)
  	end

    it "post /shop wrong " do
      post "/shop" , :params => { :shop_id => 3, :book_id => 3, :num => 5 }
      expect(response).to have_http_status(500)
    end

end
