from_range, to_range = 197_487, 673_251

def is_valid(number):
    string = str(number)
    has_double = False
    never_decrease = True
    for i in range(len(string)-1):
        curr = string[i]
        nxt  = string[i+1]
        # Check if next digit is same
        has_double = has_double or curr == nxt
        # Check if next digit decreases
        never_decrease = never_decrease and curr <= nxt
        if not never_decrease:
            return False
    return has_double and never_decrease

# Test
# print(is_valid(111111))
# print(is_valid(223450))
# print(is_valid(123789))

valid_count = 0
for number in range(from_range, to_range+1):
    if is_valid(number):
        valid_count += 1

print(valid_count)

        