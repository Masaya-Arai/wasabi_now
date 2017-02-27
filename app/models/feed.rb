class Feed < ActiveRecord::Base

  self.table_name = :feeds
  belongs_to :site
  belongs_to :category
  has_many :pages
end
