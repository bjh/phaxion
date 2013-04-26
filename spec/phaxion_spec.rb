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
    it "calls the Phaxio :send method" do
      response = Phaxion.fax(to: '555-123-1234')
      expect(response["success"]).to be_true
      expect(response["message"]).to eq "Fax queued for sending"
    end
  end

  describe ".direct" do
    context "you can call anything with direct" do
      it "posts the method to the Phaxio API" do
        response = Phaxion.direct(:send, to: '555-123-1234')
        expect(response["success"]).to be_true
      end

      it "translates the given api method to the expected camelCase version" do
        response = Phaxion.direct(:test_receive, to: '555-123-1234')
        expect(response["success"]).to be_true
      end
    end
  end

  describe "calling methods using camelCase or under_score syntax" do
    it "accepts test_receive" do
      expect(Phaxion.renamer(:test_receive)).to eq "testReceive"
    end

    it "accepts testReceive" do
      expect(Phaxion.renamer(:testReceive)).to eq "testReceive"
    end
  end
end
