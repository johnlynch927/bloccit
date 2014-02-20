class Post < ActiveRecord::Base
  attr_accessible :body, :title, :topic 
  # attr_accessible :body, :title, :topic --- so I'm adding topic here but only able to access topic_id
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope order('created_at DESC')
end

