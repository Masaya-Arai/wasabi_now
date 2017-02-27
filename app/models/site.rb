class Site < ActiveRecord::Base

  self.table_name = :sites
  has_many :feeds
end
