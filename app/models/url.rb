require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, presence: true
	validates :long_url, format: { with: /\A(http|https):\/\/\S+/i, message: "check url"}
	before_save :shorten
	validates :short_url, uniqueness: true

	# def self.shorten
	# 	SecureRandom.hex(3)
	# end
	def shorten
	self.short_url = SecureRandom.hex(3)
	end

end
