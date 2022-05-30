import numpy as np
from collections import Counter

def entropy(X):
    """
    Also known as Shanon Entropy
    Reference: https://en.wikipedia.org/wiki/Entropy_(information_theory)
    """
    counts = Counter(X)
    total = sum(counts.values(), 0.0)
    for key in counts:
        counts[key] /= total
    probs = np.array(list(counts.values()))
    res = np.sum((-1)*probs*np.log2(probs))
    return res

# Joint Entropy
def jEntropy(X, Y):
    probs = []
    for c1 in set(X):
        for c2 in set(Y):
            probs.append(np.mean(np.logical_and(X == c1, Y == c2)))
    return np.sum(-p * np.log2(p) for p in probs if p> 0.0)

# Conditional Entropy
def cEntropy(X,Y):
    """
    conditional entropy = Joint Entropy - Entropy of X
    H(X|Y) = H(X,Y) - H(Y)
    Reference: https://en.wikipedia.org/wiki/Conditional_entropy
    """
    return jEntropy(X, Y) - entropy(Y)


# Information Gain
def gain(X,Y):
    """
    Information Gain, I(Y;X) = H(Y) - H(Y|X)
    Reference: https://en.wikipedia.org/wiki/Information_gain_in_decision_trees#Formal_definition
    """
    return entropy(X) - cEntropy(X, Y)


def get_correlation(element):
    """
    Helper function to pass to the sort method, that will sort an array of tuples based on 
    the correlation value of each pair of columns.
    Tuple form: ('col1_name', 'col2_name', correlation_value)
    """
    return element[2]

def get_neighborhood(corrs_arr, left_col, threshold = 0.6):
    """
    Function that returns the neighborhood of left_col, based on correlation values.
    corrs_arr: list of tuples. Each tuple has the form ('col1_name', 'col2_name', correlation_value).
    left_col: name of the leftmost column (the one that is on the left of the functional dependency).
    Output: a list of names of the correlated columns, including the leftmost column.
    """
    neighborhood = []
    # make a copy of the array
    corrs_arr_ = corrs_arr
    # we are going to sort by correlation value, in descending order
    corrs_arr_.sort(reverse = True, key = get_correlation)
    # append the leftmost column
    neighborhood.append(left_col)
    # always add the first rightmost column
    neighborhood.append(corrs_arr_[0][1])

    # iterate over all the pairwise correlation values
    for i in range(1, len(corrs_arr_)):
        corr_ratio = (corrs_arr_[i][2]+0.1)/(corrs_arr_[i-1][2]+0.1)
        ratio_max_corr = (corrs_arr_[i][2]+0.1)/(corrs_arr_[0][2] +0.1)

        # if the difference between consecutives correlation values 
        # and if the difference with the highes correlation value 
        # is lower than threshold, then the current column is part
        # of the neighborhood
        if(corr_ratio >= threshold and ratio_max_corr >= threshold):
            neighborhood.append(corrs_arr_[i][1])
        else:
            break

    return neighborhood