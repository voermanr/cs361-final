#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'helpers'
require_relative 'track'
require_relative 'waypoint'
require_relative 'world'

def main
  w = Waypoint.new(-121.5, 45.5, 30, 'home', 'flag')
  w2 = Waypoint.new(-121.5, 45.6, nil, 'store', 'dot')
  ts1 = [
    GeographicCoordinate.new(-122, 45),
    GeographicCoordinate.new(-122, 46),
    GeographicCoordinate.new(-121, 46)
  ]

  ts2 = [
    GeographicCoordinate.new(-121, 45),
    GeographicCoordinate.new(-121, 46)
  ]

  ts3 = [
    GeographicCoordinate.new(-121, 45.5),
    GeographicCoordinate.new(-122, 45.5)
  ]

  t = Track.new([ts1, ts2], 'track 1')
  t2 = Track.new([ts3], 'track 2')

  world = World.new('My Data', [w, w2, t, t2])

  puts world.json
end

main if File.identical?(__FILE__, $PROGRAM_NAME)
