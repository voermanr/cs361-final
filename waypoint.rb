class Waypoint
  attr_reader :lat, :lon, :ele, :name, :type

  def initialize(lon, lat, ele = nil, name = nil, type = nil)
    @lat = lat
    @lon = lon
    @ele = ele
    @name = name
    @type = type
  end

  def get_waypoint_json(_indent = 0)
    message = '{"type": "Feature",'
    # if name is not nil or type is not nil
    message += '"geometry": {"type": "Point","coordinates": '
    message += "[#{@lon},#{@lat}"
    message += ",#{@ele}" unless ele.nil?
    message += ']},'
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
  end
end