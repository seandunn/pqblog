class ArticleMailer < ApplicationMailer
  default from: 'smallblog@example.com'

  def article_updated(subscription, article)
    @subscription = subscription
    @article = article
    @url = article_url(@article)
    mail(to: @subscription.email, subject: 'New article on Small blog')
  end
end
