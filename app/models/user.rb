class User < ActiveRecord::Base



	before_create :generate_token 

	def generate_token
		self.token = (0..50).collect{|i| "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890".split('').sample }.join('')	
	end

end	