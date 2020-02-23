module ApplicationHelper
  def parent_links cathegory
    return (crumb_head + crumb_foot).html_safe unless cathegory
    parents = cathegory.parent_link

    result = crumb_head
    parents.each do |parent|
       result += crumb_line parent[0], parent[1]
    end
    result += crumb_cur cathegory.name
      result += crumb_foot
      result.html_safe
  end

  def crumb_head
    "<nav aria-label=\"breadcrumb\">" +
    "<ol class=\"breadcrumb\">"
  end

  def crumb_foot
    "</ol></nav>"
  end

  def crumb_line id, line
    "<li class=\"breadcrumb-item\">" +
    link_to(line, cathegory_path(id)) +
    "</li>"
  end

  def crumb_cur line
    "<li class=\"breadcrumb-item active\" aria-current=\"page\">#{line}</li>"
  end

# _________________________________________________________

  def menu_panel(ids, level)
    res = '  <div class="row">' +
      '<div class="mr-3" style="width: 250px">' +
        '<div class="nav flex-column nav-pills" id="v-cats-tab" role="tablist" aria-orientation="vertical">' 
    body = ""
    logo = ""
    cats_next = eval("@cat" + (level+1).to_s)
    cats = eval("@cat" + level.to_s)
    return if ids.nil? || ids.compact.empty?
    ids.each do |id|
      cat = cats[id]
      card = Cathegory.find(id)
      res +=  "<a class=\"nav-link\" id=\"v-cats-#{id.to_s}-tab\" data-toggle=\"pill\"  
              data-target=\"#v-cats-#{id.to_s}\" href=\"#{request.base_url}/cathegories/#{id.to_s}\" role=\"tab\" aria-controls=\"v-cats-#{id.to_s}\" aria-selected=\"true\">#{cat[:name]} </a>"

      body += "<div class=\"tab-pane fade\" id=\"v-cats-#{id.to_s}\" role=\"tabpanel\" aria-labelledby=\"v-cats-#{id.to_s}-tab\">
      #{menu_panel(cat[:ids], level+1) } <div class=\"cat-logo\"> <img src=\"#{cat[:logo]}\"></img> </div> </div>"
      if card
        logo += image_tag(card.logo.url, class: 'img-thumbnail logo-v-cats m-3 ', id: "logo-v-cats-#{id.to_s}", style: "display: none;") if card.logo.exists?
      end
    end
    res += '   </div>' +
             '</div>'
      #cat1 body
      res += '<div class="col-9">' +
            '<div class="tab-content" id="v-cats-tabContent">'
      res += body
      res += '</div>' +
          '<div class="logo"> ' + logo + '</div>' +
        '</div>' +
      '</div>'
      return res.html_safe
  end
end
