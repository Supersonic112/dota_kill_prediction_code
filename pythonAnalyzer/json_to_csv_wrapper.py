#!bin/python3
import sys
import getopt
try:
    import json_work
except ModuleNotFoundError:
    print("please run `jupyter nbconvert --to script json_work.ipynb` to create the json work python file first")
    sys.exit(2)

def main(argv):
    fileversion = '8d'
    threadnum = 6
    numfiles = 3000
    try:
        optlist, args = getopt.getopt(argv, "hf:t:n:d", ["help", "fileversion=", "threads=", "numfiles="])
    except getopt.GetoptError:
        usage()
        sys.exit(2)
    if len(args)<2:
        usage()
        sys.exit(2)
    for opt,arg in optlist:
        if opt in ("-h","--help"):
            usage()
            sys.exit()
        elif opt in ("-f","--fileversion"):
            fileversion = arg
        elif opt in ("-t","--threads"):
            threadnum = int(arg)
        elif opt in ("-n","--numfiles"):
            numfiles = int(arg)
    json_work.convert_files(json_dir=args[0], csv_dir=args[1], file_version=fileversion, num_threads=threadnum, num_files=numfiles)

def usage():
    print("usage: ./json_to_csv_wrapper.py [-h|--help] [-f|--fileversion <fileversion>] [-t|--threads <num_of_threads>] [-n|--numfiles <number_of_files>] json_source_path csv_save_path")

if __name__ == "__main__":
    main(sys.argv[1:])
