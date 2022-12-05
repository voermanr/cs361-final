# frozen_string_literal: true

# It didn't feel like some of the classes should belong to other classes,
# so I'm going to be placing things here that I would probably call from an external library.

class Point
  attr_reader :lat, :lon, :ele

  def initialize(lon, lat, ele = nil)
    @lon = lon
    @lat = lat
    @ele = ele
  end
end
