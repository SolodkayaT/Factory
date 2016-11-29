require_relative 'factory.rb'

Customer = Factory.new(:name, :address, :zip) do
	
	def greeting
		puts "Hello #{name}!"
	end
	
end

joe = Customer.new('Joe Smith', '123 Maple, Anytown NC', 1234)
puts joe.name
puts joe['name']
puts joe[:zip]
puts joe[0]

joe[:zip]= 5678
puts joe[:zip]

Customer.new('Dave', '123 Main', 7777).greeting