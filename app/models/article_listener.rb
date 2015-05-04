class ArticleListener
  def article_added(article)

    Subscription.find_each do |subscription|
      ArticleMailer.article_updated(subscription.email, article).deliver_latter
    end
  end
end
