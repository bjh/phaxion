require 'spec_helper'
# require 'json'
require_relative '../lib/phaxion'

describe Phaxion do
	before :all do
		Phaxion.configuration do |cfg|
  		cfg.api_key = "8udf8duf8duf"
  		cfg.api_secret = "34jhdf873jh"
		end
	end

  describe ".fax" do
    it "calls the proper Phaxio API for a send/fax" do
      # Fake.register(:send)

      response = Phaxion.fax(to: '555-123-1234')
    	expect(response["success"]).to be_true
      expect(response["message"]).to eq "Fax queued for sending"
    end
  end

  # describe ".testReceive" do
  #   it "lives up to its name" do
  #     Fake.register(:testReceive)

  #     response = Phaxion.testReceive(filename: 'sheep-bollocks.pdf')
  #     expect(response["message"]).to include "Test fax received"
  #   end
  # end
end
