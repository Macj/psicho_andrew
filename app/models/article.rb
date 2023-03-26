require 'elasticsearch/model'

class Article < ActiveRecord::Base  
  extend ActiveSupport::Concern

  has_many :article_contents, dependent: :destroy
  accepts_nested_attributes_for :article_contents

  belongs_to :cathegory

  scope :with_category, ->(id) { where(cathegory_id: id) }

  #has_attached_file :image, default_url: "/assets/:style/missing.png"
  #,:s3_credentials => "#{Rails.root}/config/s3.yml"
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  STYLES = [[1,'Ordinary'], [2,'Pro']].to_h

  def self.latest(id)
  	where('id != ?', id).last(3)
  end

  def latest
    return [] unless self.cathegory
    Article.where('cathegory_id != ?', self.cathegory_id).last(3)
  end

  def self.popular(id)
    where('id != ?', id).order("view_counter DESC").first(2)
  end

  def light_text
    text = body[0...150]
    words = text.split(" ")
    words.delete(words.last)
    words.join(" ") + "..."
  end

  def make_content
    article_contents.build(ln: :ru)
    article_contents.build(ln: :ua)
  end

end