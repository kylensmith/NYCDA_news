class Topic < ActiveRecord::Base
	has_many :articles, through: :article_topic
end
