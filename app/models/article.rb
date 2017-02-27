class Article < ActiveRecord::Base

  self.table_name = :articles
  has_one :page
end
