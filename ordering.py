# Supposed to sort out X/Y address?
#Thanks to my brother
import operator
import os
def sort(source,out,number):
    file =  open(os.getcwd()+"\\"+source+"", 'r')
    b = open(os.getcwd()+"\\"+out+"", 'w')
    i = 0
    array = []
    for line in file:
        line = (line.split("\n"))
        line = ",".join(line)
        list = line.split(",")
        list.pop()
        desired_array = [int(numeric_string) for numeric_string in list]
        array.append(desired_array)
        i+=1
    array = sorted(array,key=operator.itemgetter(number-1),reverse=True)
    for line in array:
        results = [str(i) for i in line]
        print(",".join(results),file=b)
    print("DONE!! SEE YOUR FILE "+out+" !")
def launch():
    print("Hello!")
    print("Automatic(1) or Manually(2)")
    choice = input()
    if(choice == "1"):
        sort("Rresults.txt", "return.txt", 3)
    else:
        print("File ?")
        source = input()
        print("Out?")
        out = input()
        print("Number?")
        number = input()
        number = int(number)
        sort(source,out,number)

launch()