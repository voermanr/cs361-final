# frozen_string_literal: true

# It didn't feel like some of the classes should belong to other classes,
# so I'm going to be placing things here that I would probably call from an external library.

# Pretending this is a 3rd party object whose implementation I rely on, but disagree with.
class Point
  attr_reader :latitude, :longitude, :elevation

  def initialize(lon, lat, ele = nil)
    @lon = lon
    @lat = lat
    @ele = ele
  end
end

# Wrapper Class, because I think a Point should be (x,y) or (x,y,z), and
# that a collection of latitude, longitude, and elevation is a better representation
class GeographicCoordinate < Point
  def initialize(lon, lat, ele = nil)
    super
  end

  def latitude
    @lat
  end

  def longitude
    @lon
  end

  def elevation
    @ele
  end

  def json

  end
end
