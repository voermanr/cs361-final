class World
  def initialize(name, things)
    @name = name
    @features = things
  end

  def add_feature(feature)
    @features.append(feature)
  end

  def to_geojson(_indent = 0)
    # Write stuff
    s = '{"type": "FeatureCollection","features": ['
    @features.each_with_index do |f, i|
      s += ',' if i != 0
      if f.instance_of?(Track)
        s += f.track_json
      elsif f.instance_of?(Waypoint)
        s += f.get_waypoint_json
      end
    end
    "#{s}]}"
  end
end
