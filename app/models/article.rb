class Article < ActiveRecord::Base
  has_attached_file :image, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :cathegory
  STYLES = [[1,'Ordinary'], [2,'Pro']].to_h

  def latest
  	Article.where(cathegory_id: self.cathegory.id).where('id != ?', self.id).last(3)
  end
end
