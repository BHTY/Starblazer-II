file = open("thing.bin", "rb")
contents = file.read()
file.close()
print(list(contents))
