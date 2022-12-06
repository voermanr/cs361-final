# frozen_string_literal: true

class Track
  def initialize(segments, name = nil)
    @name = name
    segment_objects = []
    segments.each do |s|
      segment_objects.append(TrackSegment.new(s))
    end
    @segments = segment_objects
  end

  # I'm not going to touch the contents of this message, as the json function in Waypoint sucked enough of my time.
  def json
    message = '{'
    message += '"type": "Feature", '
    unless @name.nil?
      message += '"properties": {'
      message += "\"title\": \"#{@name}\""
      message += '},'
    end
    message += '"geometry": {'
    message += '"type": "MultiLineString",'
    message += '"coordinates": ['
    # Loop through all the segment objects
    @segments.each_with_index do |s, index|
      message += ',' if index.positive?
      message += '['
      # Loop through all the coordinates in the segment
      coordinates_block = ''
      s.coordinates.each do |c|
        coordinates_block += ',' if coordinates_block != ''
        # Add the coordinate

        # I can't figure out how to call the coordinate_json function of c,
        # but this code should be replaced with something like
        #   coordinates_block += c.coordinates_json
        coordinates_block += '['
        coordinates_block += "#{c.longitude},#{c.latitude}"
        coordinates_block += ",#{c.elevation}" unless c.elevation.nil?
        coordinates_block += ']'
      end
      message += coordinates_block
      message += ']'
    end
    "#{message}]}}"
  end
end

class TrackSegment
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end
end
