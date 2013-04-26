
module Fake
  @@base_url = "https://api.phaxio.com/v1"
  @@base_response_dir = "#{File.dirname(__FILE__)}/responses"

  def self.body(response)
    File.open(File.join(@@base_response_dir, "#{response.to_s}.json")).read
  end

  def self.content_type
    "application/json"
  end

  def self.register(action)
    FakeWeb.register_uri(:post, "#{@@base_url}/#{action.to_s}", body:body(action), content_type:content_type)
  end
end

# load all the fakeweb responses and register them by name/API call
Dir[File.dirname(__FILE__) + "/responses/*.json"].each do |file| 
  Fake.register(File.basename(file, ".*" ))
end

