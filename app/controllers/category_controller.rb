class CategoryController < ApplicationController

  def show
    @latests_list = Page.join_article
                        .join_feed_and_site
                        .in_feed_cat(params[:id])
                        .prioritize_img
                        .latest
                        .page(params[:page]).per(20)
  end
end
