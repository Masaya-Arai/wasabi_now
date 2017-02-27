class HomeController < ApplicationController

  def index
    @headlines_list = Page.join_article
                          .join_feed_and_site
                          .in_feed_cat(1)
                          .has_img
                          .latest
                          .limit(6)

    @latests_list = Page.join_article
                        .join_feed_and_site
                        .not_in_feed_cat(1)
                        .has_img
                        .latest
                        .limit(15)

    @category_headlines_list = []
    @category_highlights_list = []

    for cat_id in 1..15 do
      top = Page.join_article
                .join_feed_and_site
                .in_feed_cat(cat_id)
                .prioritize_img
                .latest
                .first

      list_model = Page.join_article
                       .join_feed_and_site
                       .in_feed_cat(cat_id)

      list = top.present? ? list_model.except_id(top.id).latest.limit(3) :
          list_model.latest.limit(3)

      @category_headlines_list.push(top)
      @category_highlights_list.push(list)
    end
  end


  def about_us
  end

  def terms_of_use
  end

  def privacy_policy
  end

  def moderation_policy
  end
end
