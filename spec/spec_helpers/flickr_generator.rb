module FlickrGeneratorHelper
  def unsigned_flickr(api_key = FLICKR_KEY)
    return Net::Flickr.authorize(api_key)
  end
  
  def signed_flickr(api_key = FLICKR_KEY, secret = FLICKR_SECRET)
    return Net::Flickr.authorize(api_key, secret)
  end
end