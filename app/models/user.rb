class User < ActiveRecord::Base
	has_many :cards

	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true, numericality: true, length: {in: 10..20}
	validates :fname, presence: true
	validates :lname, presence: true
	validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0}

	before_save :email_lowercase, :phoneform

private
	def email_lowercase
		self.email = email.to_s.downcase!	
	end

private
	def phoneform
		self.phone = phone.gsub!(/\D/,' '=>'-')
	end
end
