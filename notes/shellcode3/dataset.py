import subprocess
import os
import pickle
import signal


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


if __name__ == '__main__':
    init_dataset()
