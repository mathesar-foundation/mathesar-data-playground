"""
Script that, given a csv file, outputs a suggestion on which columns to separate and create a new table.
This script uses custom functions in a library(file) called correlation_utils.py .
Usage:
In a terminal: python detect_correlations.py <filename>
"""

import sys
import pandas as pd
import correlation_utils as utils
import time

if __name__ == "__main__":
    filename = sys.argv[1]
    data = pd.read_csv(filename)
    rows, cols = data.shape
    cols_info = {}
    worth_analyze = False
    tic = time.perf_counter()
    # Get some information about the data
    for col in data.columns:
        unique_vals = data[col].nunique(dropna=True)
        cols_info[col] = {"unique_vals": unique_vals, "type":str(data[col].dtype)}
        # If there exists a column where its number of unique values
        # Is less than 1/3 of the number of rows 
        if unique_vals < rows/3:
            # This script will proceed to compute the correlated columns
            # so we set this variable to True
            worth_analyze = True
    toc = time.perf_counter()
    print(f"First check of dataset running time {toc - tic:0.4f} seconds")
    print(cols_info)
    print("Number of rows: " + str(rows))
    
    if(worth_analyze):
        corrs = []
        tic = time.perf_counter()
        
        # Take the column with most repeated values
        c = ""
        min_uvals = rows
        for k, v in cols_info.items():
            if v["unique_vals"] < min_uvals:
                c = k
                min_uvals = v["unique_vals"]
        
        # Get the names of the other columns
        cols_queue = list(cols_info.keys())
        cols_queue.remove(c)

        # Compute pairwise correlation values
        for i in range(len(cols_queue)):
            c2 = cols_queue[i]
            X = data[c].to_numpy()
            Y = data[c2].to_numpy()
            corr = utils.entropy(X)-utils.cEntropy(X, Y)
            corrs.append((c,c2,corr))
        toc = time.perf_counter()
        print(f"Correlation computation running time {toc - tic:0.4f} seconds")
        
        # Compute highly correlated neighborhood
        tic = time.perf_counter()
        filtered_corrs = []
        for triple in corrs:
            if(triple[0]==c):
                filtered_corrs.append(triple)
        neighborhood = utils.get_neighborhood(filtered_corrs, c)
        toc = time.perf_counter()
        print(f"Neighborhood computation running time {toc - tic:0.4f} seconds")
        print('Neighborhood: '+ str(neighborhood) + ". You should consider creating a new table with these columns.")