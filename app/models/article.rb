class Article < ActiveRecord::Base
  include Wisper::Publisher

  has_many :comments, dependent: :destroy

  after_create { |article| publish(:article_added, article) }
end
