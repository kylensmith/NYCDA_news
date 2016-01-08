class Article < ActiveRecord::Base
    has_many :topics, through: :article_topics
    has_many :article_topics
    has_many :comments
	belongs_to :staff
end
