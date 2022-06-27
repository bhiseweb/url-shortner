module LinksHelper

  def short_url(link)
    "#{request.url.split("/#{params[:controller]}")[0]}/#{link.token}"
  end
end
