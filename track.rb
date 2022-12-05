class Track
  def initialize(segments, name = nil)
    @name = name
    segment_objects = []
    segments.each do |s|
      segment_objects.append(TrackSegment.new(s))
    end
    # set segments to segment_objects
    @segments = segment_objects
  end

  def track_json
    j = '{'
    j += '"type": "Feature", '
    unless @name.nil?
      j += '"properties": {'
      j += "\"title\": \"#{@name}\""
      j += '},'
    end
    j += '"geometry": {'
    j += '"type": "MultiLineString",'
    j += '"coordinates": ['
    # Loop through all the segment objects
    @segments.each_with_index do |s, index|
      j += ',' if index.positive?
      j += '['
      # Loop through all the coordinates in the segment
      tsj = ''
      s.coordinates.each do |c|
        tsj += ',' if tsj != ''
        # Add the coordinate
        tsj += '['
        tsj += "#{c.lon},#{c.lat}"
        tsj += ",#{c.ele}" unless c.ele.nil?
        tsj += ']'
      end
      j += tsj
      j += ']'
    end
    "#{j}]}}"
  end
end

class TrackSegment
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end
end