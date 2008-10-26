require (File.join(File.dirname(__FILE__), '../spec_helper.rb'))

describe Net::Flickr::Photo do
  include FlickrGeneratorHelper
  
  it "should throw an exception if no auth'ed flickr object is available" do
    lambda {
      Net::Flickr::Photo.new(PHOTO_ID)
    }.should raise_error(Net::Flickr::AuthorizationError)
  end
  
  it "should be able to call new and return a new photo object" do
    signed_flickr
    lambda {
      photo = Net::Flickr::Photo.new(PHOTO_ID)
      photo.should be_instance_of(Net::Flickr::Photo)
    }.should_not raise_error
  end
  
  it "should be able to get information about itself given a photo id" do
    pending
    # @photo.id.should == PHOTO_ID.to_s
    # @photo.owner[:nsid].should == '45285223@N00'
    # @photo.owner[:username].should == 'n8agrin'
    # @photo.title.should == 'Keeeeeeaaaaaaaaaaaa!!!!'
    # @photo.description.should == "Beauty seen in Arthur's Pass"
    # @photo.comments?.should be(false)
  end
  
  it "should throw an exception when attempting to get information for a photo with no id" do
    pending
  end
  
  it "should be able to get the tags for a photo" do
    signed_flickr
    p = Net::Flickr::Photo.new(PHOTO_W_TAGS)
    p.tags.should_not be_nil
    p.tags['wildrose'].to_s.should == 'wildrose'
  end
  
  it "should call a photo with no tags and not bork" do
    signed_flickr
    p = Net::Flickr::Photo.new(PHOTO_WO_TAGS)
    p.tags.size.should be(0)
  end
  
  it "should be able to get geolocation information for a photo" do
    signed_flickr
    p = Net::Flickr::Photo.new(PHOTO_W_GEO)
    p.geo.latitude.should  == 36.266068
    p.geo.longitude.should == -117.188184
    p.geo.accuracy.should  == 16
  end

  it "should be able to get the source url for a thumbnail" do
    unsigned_flickr
    url = 'http://farm3.static.flickr.com/2010/2373699805_e953d2173d_t.jpg'
    p = Net::Flickr::Photo.new(PHOTO_W_TAGS)
    p.source_url(:thumb).should == url
  end

  it "should be able to construct the page url" do
    unsigned_flickr
    url = 'http://www.flickr.com/photos/n8agrin/2373699805'
    p = Net::Flickr::Photo.new(PHOTO_W_TAGS)
    p.page_url.should == url
  end
end
