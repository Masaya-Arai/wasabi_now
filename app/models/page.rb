class Page < ActiveRecord::Base

  self.table_name = :pages
  belongs_to :feed
  has_one :article
  has_one :page_content
  has_one :page_thumbnail

  scope :find_by_article,
        -> (hc) { where({articles: {hash_code: hc}}) }

  scope :except_id,
        -> (p_id) { where.not(id: p_id) }

  scope :has_img,
        -> { where(has_thumbnail: 1) }

  scope :prioritize_img,
        -> { order('pages.has_thumbnail DESC') }

  scope :latest,
        -> { order('pages.published_at DESC') }

  scope :join_article,
        -> { joins(:article).eager_load(:article) }

  scope :join_page_content,
        -> { joins(:page_content).eager_load(:page_content) }

  scope :join_page_thumbnail,
        -> { left_joins(:page_thumbnail) }

  scope :join_feed_and_site,
        -> { includes(feed: :site).references(:feed, :site) }

  scope :in_feed_cat,
        -> (c) { where({feeds: {category_id: c}}) }

  scope :not_in_feed_cat,
        -> (c) { where.not({feeds: {category_id: c}}) }
end
