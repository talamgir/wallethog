class User < ActiveRecord::Base
	has_many :cards
	has_attached_file :avatar, styles: {
		medium: "300x300",
		thumb: "100x100"
	},
	default_url: "/images/:style/missing.png"

	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true, numericality: true, length: {in: 10..20}
	validates :fname, presence: true
	validates :lname, presence: true
	validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0}

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
