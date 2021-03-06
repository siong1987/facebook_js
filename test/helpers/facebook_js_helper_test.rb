require 'test_helper'

class FacebookJsHelperTest < ActionView::TestCase
  def setup
    FacebookJs.app_id = '12345'
    FacebookJs.domain = 'localhost:3000'
  end

  def teardown
    FacebookJs.status = true
    FacebookJs.cookie = true
    FacebookJs.xfbml = true
    FacebookJs.locale = 'en_US'
    FacebookJs.debug = false
  end

  test 'facebook_js should render the proper default content' do
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:true,cookie:true,xfbml:true});};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/en_US/all.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", facebook_js.split(/\n/).join("").delete(" ")
  end

  test 'facebook_js should render the proper content with proper status' do
    FacebookJs.status = false
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:false,cookie:true,xfbml:true});};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/en_US/all.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", facebook_js.split(/\n/).join("").delete(" ")
  end

  test 'facebook_js should render the proper content with proper cookie' do
    FacebookJs.cookie = false
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:true,cookie:false,xfbml:true});};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/en_US/all.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", facebook_js.split(/\n/).join("").delete(" ")
  end

  test 'facebook_js should render the proper content with proper xfbml' do
    FacebookJs.xfbml = false
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:true,cookie:true,xfbml:false});};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/en_US/all.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", facebook_js.split(/\n/).join("").delete(" ")
  end

  test 'facebook_js should render the proper content with proper debug' do
    FacebookJs.debug = true
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:true,cookie:true,xfbml:true});};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/en_US/all/debug.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", facebook_js.split(/\n/).join("").delete(" ")
  end

  test 'facebook_js should render the proper content with proper locale' do
    FacebookJs.locale = 'zh_CN'
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:true,cookie:true,xfbml:true});};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/zh_CN/all.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", facebook_js.split(/\n/).join("").delete(" ")
  end

  test 'facebook_js should render the proper content with block' do
    assert_equal "<divid=\"fb-root\"></div><script>window.fbAsyncInit=function(){FB.init({appId:'12345',channelUrl:'//localhost:3000/channel.html',status:true,cookie:true,xfbml:true});function(){}};(function(d,s,id){varjs,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src=\"//connect.facebook.net/en_US/all.js\";fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>", (facebook_js { 'function(){}' } ).split(/\n/).join("").delete(" ")
  end
end
