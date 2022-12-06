class World
  def initialize(name, things)
    @name = name
    @features = things
  end

  def add_feature(feature)
    @features.append(feature)
  end

  # TODO: should be asking for "what is your JSON?" not "Are you a class?"
  def to_geojson(_indent = 0)
    # Write stuff
    message = '{"type": "FeatureCollection","features": ['
    @features.each_with_index do |f, i|
      message += ',' if i != 0
      if f.instance_of?(Track)
        message += f.track_json
      elsif f.instance_of?(Waypoint)
        message += f.json
      end
    end
    "#{message}]}"
  end
end
