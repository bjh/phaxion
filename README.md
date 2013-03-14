# Phaxion

**pronounced like Faction**  

A (hopefully) small wrapper around the [Phaxio API](https://www.phaxio.com/docs).  
I would like it to support their PhaxCodes API as well.  

NOTE: I have borrowed gratuitously from [this phaxio gem](https://github.com/gristmill/phaxio) so all credit should probably go to that author.

ANOTHER NOTE: let's be honest, almost every single gemified API wrapper is a messy wrapper around HttParty.   
Now that is one useful gem.  
The only real win here is managing the API keys...so in reality you can call all the Phaxio
API methods with `Phaxion.direct(:phaxio_api_method, arg1:123, arg2:'magic')`, the rest of this gem is fluff. I should have named it fluffy...dammit!

## Installation

Add this line to your application's Gemfile:

    gem 'phaxion'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phaxion

## Usage

  ```ruby
  # initialize with your keys
  Phaxion.api_keys = '7d7f87d7f8d78f7'
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
  ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
