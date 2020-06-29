from_range, to_range = 197_487, 673_251
'''Part One

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
'''
from collections import Counter

def has_double(counter, number_string):
    has_double = False
    for elem, cnt in counter.items():
        if cnt != 2:
            continue
        indices = [i for i in range(len(number_string)) if number_string[i] == elem]
        has_double = has_double or abs(indices[0] - indices[1]) == 1
    return has_double

def is_valid(number):
    string = str(number)
    never_decrease = True
    counter = Counter()
    for i in range(len(string)-1):
        curr = string[i]
        nxt  = string[i+1]

        # Count digit occurence
        counter[curr] += 1

        # Check if next digit decreases
        never_decrease = never_decrease and curr <= nxt
        if not never_decrease:
            return False
    counter[nxt] += 1
    # Check for doubles
    return has_double(counter, string) and never_decrease

valid_count = 0
for number in range(from_range, to_range+1):
    if is_valid(number):
        valid_count += 1

# print(is_valid(112233))
# print(is_valid(123444))
# print(is_valid(111122))

print(valid_count)
        
