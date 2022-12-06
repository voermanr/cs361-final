# frozen_string_literal: true

class World
  def initialize(name, things)
    @name = name
    @features = things
  end

  def add_feature(feature)
    @features.append(feature)
  end

  def json(_indent = 0)
    "{\"type\": \"FeatureCollection\",\"features\": [#{features_json}]}"
  end

  private

  def features_json
    message = ''
    @features.each_with_index do |f, i|
      message += ',' if i != 0
      message += f.json
    end
    message
  end
end
