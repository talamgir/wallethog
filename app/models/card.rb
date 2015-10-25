class Card < ActiveRecord::Base
	belongs_to :user

	validates :cardnum, presence: true, uniqueness: true, numericality: true, length: {in: 15..16}
	validates :cardtype, presence: true, if: :correct_type?
	validates :seccode, presence: true, length: {is: 3}
	validates :expmonth, presence: true, inclusion: {in: [1..12]} 
	validates :expyear, presence: true

	def correct_type?
		this_card = self.cardnum
		if this_card.start_with?("34")
			return true
			puts "AMEX"
		elsif this_card.start_with?("4")
			return true
			puts "VISA"
		elsif this_card.start_with?("5")
			return true
			puts "MasterCard"
		else
			return false
			puts "We only accept VISA, MasterCard and American Express"
	end
	end		
end
