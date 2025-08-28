def merge(list1, list2):
    combined = []  # initialize an empty list to store the merged result
    i = 0  # initialize the index of list1 to zero
    j = 0  # initialize the index of list2 to zero
    while i < len(list1) and j < len(list2):
        # compare the current elements of list1 and list2, and append the smaller one to combined
        if list1[i] < list2[j]:
            combined.append(list1[i])
            i += 1
        else:
            combined.append(list2[j])
            j += 1

    # if there are any remaining elements in list1, add them to combined
    while i < len(list1):
        combined.append(list1[i])
        i += 1

    # if there are any remaining elements in list2, add them to combined
    while j < len(list2):
        combined.append(list2[j])
        j += 1

    return combined  # return the merged and sorted list


print(merge([1, 2, 7, 8], [3, 4, 5, 6]))

"""
    EXPECTED OUTPUT:
    ----------------
    [1, 2, 3, 4, 5, 6, 7, 8]

 """