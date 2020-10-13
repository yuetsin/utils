import subprocess
import os
import pickle
import signal

def banner():
    print("Welcome to 0ops shellcode trilogy.")
    print("This is shellcode III: Return of the Jedi")
    print("Input your shellcode:")

def init_dataset():
    dataset = set([])
    cache = os.path.join(os.getcwd(), "cache")
    if os.path.isfile(cache):
        f = open(cache, 'rb')
        dataset = pickle.load(f)
    else:
        with open("ReturnOfTheJedi.srt", "rb") as f:
            data = f.read()
        data = data.split(b"\r\n\r\n")
        for d in data:
            lines = d.split(b"\r\n")[2:]
            for line in lines:
                for word in line.split(b" "):
                    dataset.add(word.strip(b".,?-![]").lower())
        with open(cache, 'wb') as f:
            pickle.dump(dataset, f)
    return dataset

def main():
    dataset = init_dataset()
    banner()
    shellcode = input().encode("latin1")
    words = shellcode.split(b" ")
    if len(words)>10000:
        return
    for word in words:
        tmp = word.strip(b".,?-![]").lower()
        if tmp not in dataset:
            return
    signal.alarm(10)
    print("The Force shall free me.")
    subprocess.run(["./run",shellcode])
    return 

if __name__=="__main__":
    main()