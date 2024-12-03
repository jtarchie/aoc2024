# frozen_string_literal: true

TEST = <<~TESTCASE
  3   4
  4   3
  2   5
  1   3
  3   9
  3   3
TESTCASE

def part1(contents)
  lines = contents.split("\n")
  pairs = lines.map { |line| line.split(/\s+/).map(&:to_i) }.transpose
  pairs.map(&:sort!).first.each_with_index.reduce(0) do |sum, (_num, i)|
    sum + (pairs[0][i] - pairs[1][i]).abs
  end
end

def part2(contents)
  lines = contents.split("\n")
  pairs = lines.map { |line| line.split(/\s+/).map(&:to_i) }.transpose
  right = pairs[1].tally
  pairs[0].reduce(0) do |sum, num|
    sum + num * (right[num] || 0)
  end
end

raise "Test failed! 11 = #{part1(TEST)}" unless part1(TEST) == 11

puts part1(File.read('day1.txt'))

raise "Test failed! 31 = #{part1(TEST)}" unless part2(TEST) == 31

puts part2(File.read('day1.txt'))
