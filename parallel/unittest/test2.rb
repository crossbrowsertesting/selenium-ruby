require 'selenium-webdriver'
require 'test/unit'
 
class SampleTest2 < Test::Unit::TestCase
  def setup
    username='mikeh'
    key=''
    url = "http://#{username}:#{key}@hub.crossbrowsertesting.com:80/wd/hub"
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps["name"] = "Ruby Parallel"
    caps["browserName"] = "Chrome"
    caps["os_api_name"] = "Win8.1"
    caps["version"] = "43x64"
    caps["screen_resolution"] = "1024x768"
    @driver = Selenium::WebDriver.for(:remote,
      :url => url,
      :desired_capabilities => caps)
  end
 
  def test_post
    @driver.navigate.to "http://www.google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "Crossbrowsertesting.com"
    element.submit
  end
 
  def teardown
    @driver.quit
  end
end
