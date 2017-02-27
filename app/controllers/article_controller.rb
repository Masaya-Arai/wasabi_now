class ArticleController < ApplicationController

  def show
    articles = Page.joins(:article)
                   .eager_load(:article)
                   .find_by_article(params[:hash_code])
                   .limit(1)

    @article = articles[0]

    @related_list = Page.join_article
                        .join_feed_and_site
                        .in_feed_cat(@article.feed.category_id)
                        .except_id(@article.id)
                        .prioritize_img
                        .latest
                        .limit(11)
  end
end
