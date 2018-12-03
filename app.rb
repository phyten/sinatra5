require 'active_record'
require 'active_support/all'
require 'mysql2'
require 'sinatra'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class Customer < ActiveRecord::Base
end

get '/' do
  @customers = Customer.all
  erb :index
end

post '/create_customer' do
  customer = Customer.new
  customer.name = params[:customer_name]
  customer.description = params[:customer_description]
  customer.status = params[:customer_status]
  customer.comment = params[:customer_comment]
  customer.save
  redirect '/'
end
