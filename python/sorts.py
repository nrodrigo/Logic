
# https://www.hackerearth.com/practice/notes/sorting-and-searching-algorithms-time-complexities-cheat-sheet/

def bubble_sort(my_list):
    for i in range(len(my_list)-1, 0, -1):
        for j in range(i):
            if my_list[j] > my_list[j+1]:
                (my_list[j], my_list[j+1]) = (my_list[j+1], my_list[j])
    return my_list
            

def selection_sort(my_list):
    for i in range(len(my_list)):
        min_index = i
        for j in range(i+1, len(my_list)):
            if my_list[j] < my_list[min_index]:
                min_index = j
        if min_index != i:
            (my_list[i], my_list[min_index]) = (my_list[min_index], my_list[i])
    return my_list


def insertion_sort(my_list):
    for i in range(1, len(my_list)):
        j = i
        while my_list[j] < my_list[j-1] and j > 0:
            (my_list[j], my_list[j-1]) = (my_list[j-1], my_list[j])
            j -= 1
    return my_list



