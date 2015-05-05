class ArticleEmailJob < ActiveJob::Base
  queue_as :default

  def perform(article)
    Subscription.all.map do |subscription|
      ArticleMailer.article_updated(subscription, article).deliver
    end
  end
end
