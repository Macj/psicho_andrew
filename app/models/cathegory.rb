class Cathegory < ActiveRecord::Base
  serialize :parent_link, Array
  belongs_to  :parent,
                :class_name => "Cathegory",
                :foreign_key  => "parent_id",
                :required => false
    has_many  :sub_cathegories,
              :class_name => "Cathegory",
              :foreign_key  => "parent_id"
    has_attached_file :logo
    validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    before_save :set_parent_link, :set_level

    def set_parent_link
      val = self.parent.nil? ? [] : get_parent_link
      self.parent_link = val
    end

    def get_parent_link   
      result = []   
		  if parent
        result += parent.get_parent_link
		    result += [[parent.id, parent.name]]
		  end
		  result 
		end

		def set_level
			self.level = parent.nil? ? 1 : parent.level+1
		end
end
