from merge import merge_lists as merge


def merge_sort(my_list):
    # if the list contains only one element, it is already sorted
    if len(my_list) == 1:
        return my_list

    # find the midpoint index of the list
    mid_index = int(len(my_list) / 2)

    # recursively sort the left and right halves of the list
    left = merge_sort(my_list[:mid_index])
    right = merge_sort(my_list[mid_index:])

    # merge the sorted left and right halves of the list
    return merge(left, right)
