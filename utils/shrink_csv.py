import csv
import sys

# get the input and output file names from the command line arguments
input_file_name = sys.argv[1]
output_file_name = sys.argv[2]

# open the input and output files
with open(input_file_name, "r") as input_file, open(output_file_name, "w", newline="") as output_file:
    # create a csv reader and writer
    reader = csv.reader(input_file)
    writer = csv.writer(output_file)

    # write the first 1000 rows to the output file
    for i, row in enumerate(reader):
        if i == 10000:
            break
        writer.writerow(row)
