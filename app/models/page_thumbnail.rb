class PageThumbnail < ActiveRecord::Base

  self.table_name = :page_thumbnails
  has_one :page
end
