$:.unshift(File.join(File.dirname(__FILE__), '../lib/net'))
$:.uniq!

# require the helpers
require File.join(File.dirname(__FILE__), "spec_helpers", "flickr_generator")
require 'flickr'

# Flickr specifics for connecting to the API
FLICKR_KEY      = '3918b75b450370617b0cfe084298a78f'
FLICKR_SECRET   = 'cdae791445fe86ff'

# User info
USER_ID = '45285223@N00'

# Photo info
PHOTO_ID      = 69861682
PHOTO_W_TAGS  = PHOTO_W_GEO   = 2373699805
PHOTO_WO_TAGS = PHOTO_WO_EXIF = 2385693150
