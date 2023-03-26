class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cat_struct
  before_action :set_client
  before_filter :set_cache_headers
  around_action :switch_locale


  private
    def switch_locale(&action)
      locale = params[:locale] || I18n.default_locale
      I18n.with_locale(locale, &action)
    end
  
    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end


    def set_client
      @client = Client.new
      @services = Service.all[0..2]
    end

    def set_cat_struct
      @cat1_ids = Cathegory.where(level: 1).pluck('cathegories.id')
      @cat1 = set_cat 1
      @cat2 = set_cat 2
      @cat3 = {}
      Cathegory.where(level: 3).pluck('cathegories.id, cathegories.name, cathegories.logo_file_name').each do |id, name, logo|
        @cat3[id] = { name: name, logo: logo }
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
