f = open("input.txt", "r")
lines = f.read().splitlines()

def most_common_bit(col, numbers):
    return int((sum([int(row[col]) for row in numbers])*1.0) >= len(numbers)/2)

def filter_by_bit(bit, col, numbers):
    return list(filter(lambda x: x[col] == str(bit), numbers))

def rating(numbers, choose):
    def go(state, col):
        if len(state) == 1:
            return int(state[0], 2)
        else:
            cbit = choose(most_common_bit(col, numbers=state))
            remaining = filter_by_bit(cbit, col, state)
            return go(remaining, col+1)
    return go(numbers, 0)

print(rating(lines, lambda bit: bit)*rating(lines, lambda bit: bit ^ 1))
