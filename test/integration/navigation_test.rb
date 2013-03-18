require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test '/channel.html should have the proper content' do
    get '/channel.html'
    assert_equal "<script src='//connect.facebook.net/en_US/all.js'></script>", body
  end

  test '/channel.html should have the proper headers' do
    get '/channel.html'
    assert_equal "public", headers[:"Pragma"]
    assert_equal "max-age=31536000", headers[:"Cache-Control"]
    assert_equal "public", headers[:"Pragma"]
    assert headers[:"Expires"]
  end
end