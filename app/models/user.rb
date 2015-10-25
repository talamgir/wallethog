class User < ActiveRecord::Base
	has_many :cards

	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true, numericality: true, length: {in: 10..20}
	validates :fname, presence: true
	validates :lname, presence: true
	validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0}

	before_save :email_lowercase, :phoneform

	def email_lowercase
		emaildowncase = self.email.to_s.downcase!
		self.email = emaildowncase
		self.save
	end

	def phoneform
		number = self.phone.gsub!(/\D/,' '=>'-')
		self.phone = number
		self.save
	end
end
