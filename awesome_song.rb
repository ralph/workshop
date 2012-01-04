require './song'
require './crazyness'

class AwesomeSong < Song
  include Crazyness

  attr_accessor :awesomeness
end
