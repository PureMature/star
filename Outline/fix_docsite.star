input_dir = "markdown"
output_dir = "../Writerside/topics/library"

in_files = [f for f in path.listdir(input_dir) if f.endswith(".md") and not f.startswith(".")]
print("Found %d files to convert" % len(in_files))

def handle_file(in_file):
    stat = file.stat(in_file)
    op = path.join(output_dir, "lib-" + stat.name)
    lines = file.read_lines(in_file)
    result = []
    heading = ""
    for l in lines:
        if l.startswith("### `") or l.startswith("#### `"):
            ps = l.find("`")
            pe = l.find("(")
            if pe == -1:
                pe = l.find("`")
            word = l[ps+1:pe]
            if len(word) > 0:
                heading = word
                # l = l + ' {id="%s-define"}' % heading
                # print("Found heading: %s" % heading)
        elif l.startswith("#### Parameters") or l.startswith("##### Parameters"):
            if len(heading) > 0 and ' {id=' not in l:
                l = l + ' {id="%s-param"}' % heading
        elif l.startswith("#### Examples") or l.startswith("##### Examples"):
            if len(heading) > 0 and ' {id=' not in l:
                l = l + ' {id="%s-example"}' % heading
        result.append(l)
    file.write_lines(op, result)
    print("Converted %s to %s" % (in_file, op))

for in_file in in_files:
    handle_file(in_file)
