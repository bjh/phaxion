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
      response = Phaxion.fax(to: '555-123-1234')
    	expect(response["success"]).to be_true
      expect(response["message"]).to eq "Fax queued for sending"
    end
  end

  # describe ".testReceive" do
  #   it "lives up to its name" do
  #     response = Phaxion.testReceive(filename: 'sheep-bollocks.pdf')
  #     expect(response["message"]).to include "Test fax received"
  #   end
  # end

  describe ".direct" do
    context "the method you want to call is not in the api list" do
      it "raises an error" do
        expect{ Phaxion.magic(to: '555-123-1234') }.to raise_error NoMethodError
      end
    end

    context "you can call anything with direct" do
      it "posts the method to the Phaxio API" do
        response = Phaxion.direct(:send, to: '555-123-1234')
        expect(response["success"]).to be_true
      end
    end
  end
end
