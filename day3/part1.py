f = open("input.txt", "r")
lines = f.read().splitlines()
n_rows = len(lines)
n_cols = len(lines[0])
gamma = ""
epsilon = ""
for col in range(n_cols):
    col_sum = sum([int(line[col]) for line in lines])
    if col_sum < int(n_rows/2):
        gamma += "0"
        epsilon += "1"
    else:
        gamma += "1"
        epsilon += "0"

print(int(gamma, 2)*int(epsilon, 2))
