require 'sinatra'
require "httparty"
require "nokogiri"
# # require "stock_quote"

request_url = "http://finance.yahoo.com/q?s=FB"

response = HTTParty.get(request_url)

dom = Nokogiri::HTML(response.body)
ticker_value = dom.xpath("//span[@id='yfs_l84_fb']").first

get '/' do
ticker_value.content

end
