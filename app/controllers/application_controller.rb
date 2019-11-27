class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cat_struct
  before_action :set_client


  private
    def set_client
      @client = Client.new
    end

    def set_cat_struct
      @cat1_ids = Cathegory.where(level: 1).pluck('cathegories.id')
      @cat1 = set_cat 1
      @cat2 = set_cat 2
      @cat3 = {}
      Cathegory.where(level: 3).pluck('cathegories.id, cathegories.name').each do |id, name|
        @cat3[id] = { name: name }
      end
    end

    def set_cat level
      cats = {}
      Cathegory.group('cathegories.id').
      where('cathegories.level=?', level).
      joins('LEFT JOIN "cathegories" as "sub" ON "sub"."parent_id" = "cathegories"."id"').
      pluck('cathegories.id, cathegories.name, array_agg(sub.id)').each do |id, name, ids|
       cats[id] = { name: name, ids: ids }
      end
      cats
    end
end
