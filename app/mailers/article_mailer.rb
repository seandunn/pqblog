class ArticleMailer < ApplicationMailer

  def article_updated(email, article)
    @email = email
    @article = article
    @unsubscribe_link = link_to('Unsubscribe', subscription_url(article), method: :delete)
    mail(to: @email, subject: 'New article on Small blog')
  end
end
