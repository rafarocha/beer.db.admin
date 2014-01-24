# encoding: utf-8

module ApplicationHelper

  # todo/fix: try/polish breadcrumb helper
  def breadcrumb(*parts)
    content_for :breadcrumb do
      parts.join( ' › ' )
    end
  end

  def signed_in?
    session[:user_id].nil? == false
  end
  
  def current_user
    User.find( session[:user_id] )
  end
  
  def current_user_id
    session[:user_id]
  end
  
  def current_user?( user )
    session[:user_id] == user.id
  end



  def powered_by
    content_tag :div do
      link_to( 'Questions? Comments?', 'http://groups.google.com/group/beerdb' ) + " | " +
      link_to( "world.db/#{WorldDb::VERSION}", 'https://github.com/geraldb/world.db.ruby' )  + ', ' +
      link_to( "beer.db/#{BeerDb::VERSION}", 'https://github.com/geraldb/beer.db.ruby' ) + ' - ' + 
      content_tag( :span, "Ruby/#{RUBY_VERSION} (#{RUBY_RELEASE_DATE}/#{RUBY_PLATFORM}) on") + ' ' +
      content_tag( :span, "Rails/#{Rails.version} (#{Rails.env})" ) + " | " + 
      link_to( 'Icon Drawer Flags', 'http://www.icondrawer.com' )
      ## content_tag( :span, "#{request.headers['SERVER_SOFTWARE'] || request.headers['SERVER']}" )
    end
  end

  def image_tag_for_country( country, opts={} )
    if opts[:size] == 'large' || opts[:size] == '64x64'
      image_tag "flags/64x64/#{country.key}.png"
    else
      image_tag "flags/24x24/#{country.key}.png"
    end
  end

end
