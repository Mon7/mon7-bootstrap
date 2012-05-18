# encoding: utf-8

#require 'dm-core'
#require 'dm-types'
#require 'dm-serializer'
#require 'dm-validations'
#require 'dm-aggregates'
#require 'dm-transactions'
#require 'dm-constraints'

#DataMapper::Property::String.length(255)
Dir["./lib/models/*.rb"].each { |file| require file }
#DataMapper.finalize
