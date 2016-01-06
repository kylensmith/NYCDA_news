class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :staff
	belongs_to :subscribers
	
end
