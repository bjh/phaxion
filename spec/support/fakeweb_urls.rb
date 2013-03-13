
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
    # puts "Fake.register: %s" % "#{@@base_url}/#{action.to_s}"
    FakeWeb.register_uri(:post, "#{@@base_url}/#{action.to_s}", body:body(action), content_type:content_type)
  end
end


Fake.register(:send)
# Fake.register(:testReceive)
# Fake.register(:provisionNumber)
# Fake.register(:releaseNumber)
# Fake.register(:numberList)
# Fake.register(:faxFile)
# Fake.register(:faxList)
# Fake.register(:faxStatus)
# Fake.register(:faxCancel)
# Fake.register(:accountStatus)

