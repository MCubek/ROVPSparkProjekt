import pandas as pd
import sys

# get the input file name and output file name from the command line arguments
input_file_name = sys.argv[1]
output_file_name = sys.argv[2]

# read the parquet file into a pandas dataframe
df = pd.read_parquet(input_file_name)

# save the dataframe to a csv file
df.to_csv(output_file_name)
