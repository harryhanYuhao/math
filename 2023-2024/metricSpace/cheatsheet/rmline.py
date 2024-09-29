def remove_color_lines(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        inside_color_block = False
        for line in infile:
            if r'\color{red}' in line:
                inside_color_block = True
            elif r'\color{black}' in line:
                inside_color_block = False
            elif not inside_color_block:
                outfile.write(line)

# Example usage:
input_file = 'main.tex'
output_file = 'output.txt'
remove_color_lines(input_file, output_file)
print("Lines between \color{red} and \color{black} removed.")

