class Topic < ActiveRecord::Base
	has_many :articles, through: :article_topics
	has_many :articles
end
