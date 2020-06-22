"""
--- Day 1: The Tyranny of the Rocket Equation ---
Santa has become stranded at the edge of the Solar System while delivering 
presents to other planets! To accurately calculate his position in space, 
safely align his warp drive, and return to Earth in time to save Christmas, 
he needs you to bring him measurements from fifty stars.

Collect stars by solving puzzles. Two puzzles will be made available on each 
day in the Advent calendar; the second puzzle is unlocked when you complete 
the first. Each puzzle grants one star. Good luck!

The Elves quickly load you into a spacecraft and prepare to launch.

At the first Go / No Go poll, every Elf is Go until the Fuel Counter-Upper. 
They haven't determined the amount of fuel required yet.

Fuel required to launch a given module is based on its mass. Specifically, 
to find the fuel required for a module, take its mass, divide by three, 
round down, and subtract 2.

For example:

- For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
- For a mass of 14, dividing by 3 and rounding down still yields 4, 
  so the fuel required is also 2.
- For a mass of 1969, the fuel required is 654.
- For a mass of 100756, the fuel required is 33583.

The Fuel Counter-Upper needs to know the total fuel requirement. 
To find it, individually calculate the fuel needed for the mass of 
each module (your puzzle input), then add together all the fuel values.

What is the sum of the fuel requirements for all of the modules on your spacecraft?
"""

# PART ONE

masses = """140170
75120
75645
134664
124948
137630
146662
116881
120030
94332
50473
59361
128237
84894
51368
128802
57275
129235
113481
66378
55842
90548
107696
53603
130458
80306
120820
131313
100303
59224
123369
140584
60642
68184
103101
82278
51968
51048
98139
60498
127082
71197
109478
71286
84840
141305
51800
72352
93147
73549
122739
62363
58453
59000
63564
63424
51053
120826
123337
130824
59053
77983
68977
67126
96051
53024
145647
139343
113236
59396
146174
148622
83384
86938
100673
80757
107675
147417
124538
136463
104609
149559
136037
54997
139674
101638
65739
70029
143847
122035
66256
78087
105045
108867
99630
127173
139021
139759
134171
104869""".split("\n")

def get_fuel_requirement(input_fuel):
    return input_fuel // 3 - 2

total = 0

for mass in masses:
    total += get_fuel_requirement(int(mass))

print(total)

# PART TWO
def get_fuel_requirement(input_fuel):
    total = 0
    fuel = input_fuel
    while True:
        fuel = fuel//3 - 2
        if fuel < 0:
            break
        total += fuel
    return total

total = 0

for mass in masses:
    total += get_fuel_requirement(int(mass))

print(total)