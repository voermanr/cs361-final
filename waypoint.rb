# frozen_string_literal: true

class Waypoint < GeographicCoordinate
  attr_reader :latitude, :longitude, :elevation, :name, :type

  def initialize(lon, lat, ele = nil, name = nil, type = nil)
    super(lon, lat, ele)
    @latitude = lat
    @longitude = lon
    @elevation = ele
    @name = name
    @type = type
  end

  # I am having tons of trouble trying to make this function more manageable.
  # I've spent a few hours getting nowhere on this json function.
  def json(_indent = 0)
    # if name is not nil or type is not nil

    message = ''
    if !name.nil? || !type.nil?
      message += '"properties": {'
      message += "\"title\": \"#{@name}\"" unless name.nil?
      unless type.nil? # if type is not nil
        message += ',' unless name.nil?
        message += "\"icon\": \"#{@type}\"" # type is the icon
      end
      message += '}'
    end
    message += '}'

    construct_json_message + message.to_s
  end

  private

  def construct_json_message
    "{\"type\": \"Feature\",\"geometry\": {\"type\": \"Point\",\"coordinates\": #{coordinates_json}]},"
  end

  def coordinates_json
    "[#{@longitude},#{@latitude}" + elevation_json
  end

  def elevation_json
    !elevation.nil? ? ",#{@elevation}" : ''
  end
end
