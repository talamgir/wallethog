class Card < ActiveRecord::Base
	
	belongs_to :user

	
	validates :cardnum, presence: true, uniqueness: true, numericality: true, length: {in: 15..16}
	validates :seccode, presence: true, length: {is: 3}
	validates :expmonth, presence: true, inclusion: 1..12
	validates :expyear, presence: true, length: {is: 4}, numericality: { greater_than_or_equal_to: 2015}

	validate :cardtype_is_valid

	private
	# http://guides.rubyonrails.org/active_record_validations.html#custom-validators
	def cardtype_is_valid
		puts "TIM>>>>>>>>>>> Card.cardtype_is_valid()"

		if cardnum.match(/^(34|4|5)/).nil? 
			errors.add(:invalid_cardtype, "Cardtype is not a valid Visa/Mastercard/AMEX card.")
		end
	end
end
