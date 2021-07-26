require 'elasticsearch/model'

class Article < ActiveRecord::Base  
  extend ActiveSupport::Concern
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title, type: String
  field :body, type: String
  field :tags, type: String
  index_name "articles-#{Rails.env}"

  scope :with_category, ->(id) { where(cathegory_id: id) }
  serialize :tags, Array

  has_attached_file :image, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :cathegory
  STYLES = [[1,'Ordinary'], [2,'Pro']].to_h

  def self.latest(id)
  	Article.where('id != ?', id).last(3)
  end

  def latest
    return [] unless self.cathegory
    Article.where('cathegory_id != ?', self.cathegory_id).last(3)
  end

  def light_text
    text = body[0...150]
    words = text.split(" ")
    words.delete(words.last)
    words.join(" ") + "..."
  end

  # elasticsearch
  after_commit on: [:create] do
    begin
      __elasticsearch__.index_document
    rescue Exception => ex
      logger.error "ElasticSearch after_commit error on create: #{ex.message}"
    end
  end

  after_commit on: [:update] do
    begin
      Elasticsearch::Model.client.exists?(index: 'articles', type: 'article', id: self.id) ? __elasticsearch__.update_document :     __elasticsearch__.index_document
    rescue Exception => ex
      logger.error "ElasticSearch after_commit error on update: #{ex.message}"
    end
  end

  after_commit on: [:destroy] do
    begin
      __elasticsearch__.delete_document
    rescue Exception => ex
      logger.error "ElasticSearch after_commit error on delete: #{ex.message}"
    end
  end
end