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
    Point.new(-122, 45),
    Point.new(-122, 46),
    Point.new(-121, 46)
  ]

  ts2 = [Point.new(-121, 45), Point.new(-121, 46)]

  ts3 = [
    Point.new(-121, 45.5),
    Point.new(-122, 45.5)
  ]

  t = Track.new([ts1, ts2], 'track 1')
  t2 = Track.new([ts3], 'track 2')

  world = World.new('My Data', [w, w2, t, t2])

  puts world.to_geojson
end

main if File.identical?(__FILE__, $PROGRAM_NAME)
