module ApplicationHelper
  def title(page_title)
    content_for(:title){ page_title }
  end

  def sortable(column, title=nil)
    title ||= column.titleize
    direction = params[:direction] == 'desc' ? 'asc' : 'desc'
    # link_to title, sort:column, direction:direction, page:params[:page], remote:true
    link_to title, params.merge(sort:column, direction:direction, page:1), remote:true
  end
end
