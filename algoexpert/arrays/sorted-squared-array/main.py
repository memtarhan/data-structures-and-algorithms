def sorted_squared_array(arr):
    sorted_squared_arr = []

    for item in arr:
        result = item ** 2
        if len(sorted_squared_arr) == 0:
            sorted_squared_arr.append(result)
        else:
            if sorted_squared_arr[-1] <= result:
                sorted_squared_arr.append(result)
            else:
                sorted_squared_arr.insert(len(sorted_squared_arr) - 2, result)

    return sorted_squared_arr


if __name__ == '__main__':
    array = [1, 4, 9, 16, 25]
    squared = sorted_squared_array(array)
    print(squared)
