class PageContent < ActiveRecord::Base

  self.table_name = :page_contents
  has_one :page
end
