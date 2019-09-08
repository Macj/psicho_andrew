class Article < ActiveRecord::Base
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :cathegory
  STYLES = [[1,'Ordinary'], [2,'Pro']].to_h
end
