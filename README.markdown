# net-flickr
Net::Flickr is an elegant, Ruby-fied implementation of Flickr's REST API. 
It's currently under heavy development, but is already quite usable. 

Original project at <http://code.google.com/p/net-flickr/>, this fork
by mat resides on <http://github.com/mat/>.


## Requirements

* Ruby 1.8.5+ 
* Hpricot 0.5+ 

## Basic Usage

		#!/usr/bin/env ruby
		require 'rubygems'
		require 'net/flickr'

		flickr = Net::Flickr.authorize('524266cbd9d3c2xa2679fee8b337fip2')

		# Print the titles of the 100 newest Flickr photos.
		flickr.photos.recent.each {|photo| puts photo.title }

		# Print the titles of the last 10 photos uploaded by user wonko.
		flickr.people.find_by_username('wonko').photos('per_page' => 10).each do |photo|
		  puts photo.title
		end

		# Print the titles of the 10 most recent public photos tagged with either
		# 'monkey' or 'ninja'.
		flickr.photos.search('tags' => 'monkey,ninja', 'per_page' => 10).each do |photo|
		  puts photo.title
		end
