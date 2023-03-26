class ArticleContent < ApplicationRecord
  belongs_to :article
  serialize :tags, Array

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # index_name "articles-#{Rails.env}-#{ln}"
	
  # # elasticsearch
  # after_commit on: [:create] do
  #   begin
  #     __elasticsearch__.index_document
  #   rescue Exception => ex
  #     logger.error "ElasticSearch after_commit error on create: #{ex.message}"
  #   end
  # end

  # after_commit on: [:update] do
  #   begin
  #     Elasticsearch::Model.client.exists?(index: 'articles', type: 'article', id: self.id) ? __elasticsearch__.update_document :     __elasticsearch__.index_document
  #   rescue Exception => ex
  #     logger.error "ElasticSearch after_commit error on update: #{ex.message}"
  #   end
  # end

  # after_commit on: [:destroy] do
  #   begin
  #     __elasticsearch__.delete_document
  #   rescue Exception => ex
  #     logger.error "ElasticSearch after_commit error on delete: #{ex.message}"
  #   end
  # end
end
