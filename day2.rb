# frozen_string_literal: true

TEST = <<~TESTCASE
  7 6 4 2 1
  1 2 7 8 9
  9 7 6 2 1
  1 3 2 4 5
  8 6 4 4 1
  1 3 6 7 9
TESTCASE

def part1(contents)
  lines = contents.split("\n")
  parts = lines.map { |line| line.split(/\s+/).map(&:to_i) }
  parts.filter do |part|
    valid?(part)
  end.count
end

def valid?(part)
  deltas = (0..part.length - 2).map { |i| part[i] - part[i + 1] }
  deltas.all? { |delta| deltas[0].positive? == delta.positive? || deltas[0].negative? == delta.negative? } &&
    deltas.all? { |delta| (1..3).include?(delta.abs) }
end

def part2(contents)
  lines = contents.split("\n")
  parts = lines.map { |line| line.split(/\s+/).map(&:to_i) }

  parts.map do |part|
    if valid?(part)
      true
    else
      part.each_with_index.any? do |_, i|
        valid?(part[0...i] + part[i + 1..])
      end
    end
  end.tally[true]
end

raise "Test failed! 2 = #{part1(TEST)}" unless part1(TEST) == 2

puts part1(File.read('day2.txt'))

raise "Test failed! 4 = #{part2(TEST)}" unless part2(TEST) == 4

puts part2(File.read('day2.txt'))
