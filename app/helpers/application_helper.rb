module ApplicationHelper

  def cat_list
    c = {}
    Category.all.each do |o|
      c[o.id] = o
    end
    res = Hash[c.sort]
    logger.warn(res)
    res
  end


  def abs_url(rel_url)
    request.base_url + rel_url
  end


  def format_unixtime(ut, is_mobile=false)
    is_mobile ? Time.at(ut).to_s(:mb_published_at) : Time.at(ut).to_s(:pc_published_at)
  end


  def default_meta_tags
    site = 'wasabi now'
    url = abs_url(request.path)
    title = 'wasabi now'
    description = 'wasabi now news media'
    image = abs_url('/logo_og.jpg')

    {
        charset: 'UTF-8',
        viewport: 'width=device-width,initial-scale=1',
        #robots: 'index,follow',
        site: site,
        separator: '|',
        reverse: true,
        title: title,
        description: description,
        canonical: url,
        #'google-site-verification': '',
        og: {
            #locale: 'en_EN',
            type: 'article',
            site_name: site,
            url: url,
            title: title,
            description: description,
            image: image
        },
        twitter: {
            card: 'summary_large_image',
            title: title,
            description: description,
            image: image
        }
    }
  end
end
