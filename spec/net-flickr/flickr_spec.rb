require (File.join(File.dirname(__FILE__), '../spec_helper.rb'))

describe Net::Flickr do
  include FlickrGeneratorHelper
  
  before do
    @flickr = signed_flickr
  end
  
  it "should be a singleton" do
    @flickr.should eql(Net::Flickr.authorize(FLICKR_KEY, FLICKR_SECRET))
  end
  
  it "should properly sign a url during the flickr.auth procedure" do
    pending
  end
  
  it "should properly sign a request to the Flickr api" do
    pending
  end
  
  it "should save the response as a parsed Hpricot object" do
    @flickr.request('flickr.test.echo', {'foo' => 'bar'})
    @flickr.response.should_not be_nil
    @flickr.response.should be_an_instance_of(Hpricot::Elem)
  end
  
  it "should throw an APIError if the Flickr API key is not valid" do
    @flickr.api_key = ''
    lambda {
      @flickr.request('flickr.test.echo') 
    }.should raise_error(Net::Flickr::APIError)
  end
  
  it "should not throw an Exception when calling the test.echo method" do
    lambda {
      @flickr.request('flickr.test.echo')
    }.should_not raise_error
  end
  
  it "should call flickr.test.echo and echo back the parameters passed in" do
    @response = @flickr.request('flickr.test.echo', {'foo' => 'bar', 'one' => 'two'})
    @response.at('foo').inner_text.should == "bar"
  end
  
  it "should be able to accept and sort parameters in a has with string keys and symbol keys" do
    lambda {
      @response = @flickr.request('flickr.test.echo', {:foo => 'bar', 'buckle' => 'shoe'})
    }.should_not raise_error
    
    @response.at('foo').inner_text.should == 'bar'
  end
  
  it "should call flickr.test.echo and use the last 'foo' in the args list when multiple 'foo's are passed in" do
    lambda {
      @response = @flickr.request('flickr.test.echo', {:foo => 'bar', 'foo' => 'goo'})
    }.should_not raise_error
    
    @response.at('foo').inner_text.should == 'goo'
  end
  
  it "should call flickr.test.null and throw an error because of missing read permissions" do
    lambda {
      @flickr.request('flickr.test.null')
    }.should raise_error(Net::Flickr::APIError)
  end
  
  after do
    @flickr = nil
  end

end