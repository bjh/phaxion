# Phaxion

**pronounced like Faction**  

A (hopefully) small wrapper around the [Phaxio API](https://www.phaxio.com/docs).  

I made it to be flexible regarding what Phaxio API methods can be called.  
You can use camel case `sexyMethodCall` or be more Ruby-esque `sexy_method_call` and the gem figures it out for you.

**NOTE:** I have borrowed gratuitously from [this phaxio gem](https://github.com/gristmill/phaxio) so all credit should probably go to that author.
The reason I wrote this was because the aforementioned gem author hardcoded the available methods you could call on the Phaxio API. 
This cut out PhaxCodes and some other fun things.

**ANOTHER NOTE:** let's be honest, almost every single gemified API wrapper is a messy wrapper around HttParty. *Now that is one useful gem.*  

The only real win here is managing the API keys...you can actually call all the Phaxio
API methods using this gem like so: `Phaxion.direct(:phaxio_api_method, arg1:123, arg2:'magic')`, the rest of this gem is fluff. I should have named it fluffy...dammit!

## Installation

Add this line to your application's Gemfile:

    gem 'phaxion'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phaxion

## Usage

**note:** Phaxio uses `send` as the name of a method which conflicts with Ruby so I have mapped it to `fax`. This is the only method name I have changed. I did not want to mess around with aliasing and other *meta*.

  ```ruby
  # initialize with your keys
  Phaxion.api_key = '7d7f87d7f8d78f7'
  Phaxion.api_secret = '999dfdf33f3f'
  
  # OR
  Phaxion.configuration do |cfg|
    cfg.api_key = "8udf8duf8duf"
  	cfg.api_secret = "34jhdf873jh"
  end
  
  # enjoy the magic
  Phaxion.fax(to: '555-123-1234' string_data:"hello there fax people!")
  
  # you are mad at me cause I was lazy and did not wrap one of the Phaxio API methods...
  # just call it directly
  Phaxion.direct(:send, to: '555-123-1234' string_data:"hello there fax people!")
  
  # use camelCase OR Ruby style api names
  Phaxion.test_receive == Phaxion.testReceive
  ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
