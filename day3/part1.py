f = open("input.txt", "r")
lines = f.read().splitlines()
n_rows = len(lines)
n_cols = len(lines[0])
gamma = ""
epsilon = ""
for col in range(n_cols):
    col_elems = []
    for line in lines:
        col_elems.append(int(line[col]))
    if sum(col_elems) < int(n_rows/2):
        gamma += "0"
        epsilon += "1"
    else:
        gamma += "1"
        epsilon += "0"

print(int(gamma, 2)*int(epsilon, 2))
