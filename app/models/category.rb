class Category < ActiveRecord::Base

  self.table_name = :categories
  has_many :feeds
end
