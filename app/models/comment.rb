class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :article
  validates_presence_of :screen_name
  validates_presence_of :body
end
