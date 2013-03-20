module FacebookJsHelper
  def facebook_js(opts={}, &block)
    turbolink = opts[:turbolink] ? opts[:turbolink] : false

    if block_given?
      block = capture(&block)
    else
      block = nil
    end

    render partial: 'facebook_js_helper/facebook', locals: {
      app_id: FacebookJs.app_id,
      domain: FacebookJs.domain,
      status: FacebookJs.status,
      cookie: FacebookJs.cookie,
      xfbml: FacebookJs.xfbml,
      debug: FacebookJs.debug,
      locale: FacebookJs.locale,
      block: block,
      turbolink: turbolink
    }
  end
end
