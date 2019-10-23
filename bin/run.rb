require 'pry'
require_relative './menu.rb'
require_relative '../config/environment'

tada = Menu.new()

tada.start

Pry.start
