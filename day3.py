import re

def part1(input):
    matcher = r"mul\((\d+),(\d+)\)"
    matches = re.findall(matcher, input)
    sum = 0
    for match in matches:
        sum += int(match[0]) * int(match[1])
    return sum


def part2(input):
    matcher = r"mul\((\d+),(\d+)\)|(do\(\))|(don't\(\))"
    matches = re.findall(matcher, input)
    sum = 0
    do = True
    for match in matches:
        if match[2] == "do()":
            do = True
        elif match[3] == "don't()":
            do = False
        elif do:
            sum += int(match[0]) * int(match[1])
    return sum


with open("day3.txt") as f:
    lines = "\n".join(f.readlines())

assert part1("xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))") == 161
print(part1(lines))

assert part2("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))") == 48
print(part2(lines))
