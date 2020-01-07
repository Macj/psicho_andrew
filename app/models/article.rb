require 'elasticsearch/model'

class Article < ActiveRecord::Base  
  extend ActiveSupport::Concern
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # field :title, type: String
  # field :body, type: String
  # field :tags, type: String
  #index_name "articles-#{Rails.env}"

  has_attached_file :image, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :cathegory
  STYLES = [[1,'Ordinary'], [2,'Pro']].to_h

  def latest
  	Article.where(cathegory_id: self.cathegory.id).where('id != ?', self.id).last(3)
  end
end