# encoding: utf-8

require './lib/models'
Dir["./lib/controllers/*.rb"].each { |file| require file }
