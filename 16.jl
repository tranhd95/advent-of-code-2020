function parse_input(path)
    lines = split(read(path, String), "\r\n\r\n")
    ranges = eachmatch(r"(\d+-\d+)", lines[1]) |> collect .|> m -> m.match .|> 
             m -> split(m, "-") .|> m -> parse(Int, m)
    nearby = eachmatch(r"\d+", lines[3]) |> collect .|> m -> parse(Int, m.match)
    ranges, nearby
end

function parse_input2(path)
    lines = split(read(path, String), "\r\n\r\n")
    ranges = eachmatch(r"(\d+-\d+)", lines[1]) |> collect .|> m -> m.match .|> 
             m -> split(m, "-") .|> m -> parse(Int, m)
    nearby = split(lines[3], "\r\n")[2:end] .|> ticket -> 
             split(ticket, ",") .|> t -> parse(Int, t) 
    ranges, nearby
end

function part1(input_path)
    ranges, nearby = parse_input(input_path)
    result = 0
    for n in nearby
        if !any(range -> range[1] ≤ n ≤ range[2], ranges)
            result += n
        end
    end
    result
end

function part2(input_path)
    ranges, nearby = parse_input2(input_path)
    is_invalid = ticket -> 
        !any(num -> !any(range -> range[1] ≤ num ≤ range[2], ranges), ticket)
    filtered = filter(is_invalid, nearby)
end

part2("files/16.test")
