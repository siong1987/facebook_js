module FacebookJs
  mattr_accessor :locale, :domain, :app_id, :status, :cookie, :xfbml, :debug

  module App
    class << self
      def call(env)
        [
          200,
          { :"Pragma" => "public", :"Cache-Control" => "max-age=#{60*60*24*365}", :"Expires" => CGI.rfc1123_date(1.year.from_now), :"Content-Type" => "text/html" },
          ["<script src='//connect.facebook.net/#{FacebookJs.locale}/all.js'></script>"]
        ]
      end
    end
  end

  class << self
    def locale
      @@locale || "en_US"
    end

    def status
      @@status.nil? ? true : @@status
    end

    def cookie
      @@cookie .nil? ? true : @@cookie
    end

    def xfbml
      @@xfbml.nil? ? true : @@xfbml
    end

    def debug
      @@debug.nil? ? false : @@debug
    end
  end

  class Engine < ::Rails::Engine
    initializer "facebook_js.configure_router", before: :add_routing_paths do |app|
      app.routes.prepend do
        mount FacebookJs::App => '/channel.html'
      end
    end
  end
end
