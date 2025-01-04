require_relative "test_helper"
class TestApp < Rulers::Application #l'application à tester. On a juste besoin de créer une instance
end
  
class RulersAppTest < Minitest::Test
  include Rack::Test::Methods
  #simule req Http

  def app 
    TestApp.new
  end

  def test_request
    get "/"

    #last_response = method Rack::Test
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_status
    get "/"
    assert_equal 200, last_response.status 
  end
end
