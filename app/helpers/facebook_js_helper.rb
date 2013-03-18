module FacebookJsHelper
  def facebook_js
    render partial: 'facebook_js_helper/facebook', locals: {
      app_id: FacebookJs.app_id,
      domain: FacebookJs.domain,
      status: FacebookJs.status,
      cookie: FacebookJs.cookie,
      xfbml: FacebookJs.xfbml,
      debug: FacebookJs.debug
    }
  end
end
