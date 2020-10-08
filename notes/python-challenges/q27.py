#!/usr/bin/env python3
import os


def level_27(answer):
    assert(isinstance(answer, bytes))
    test_file = 'test.txt'
    tmpdir = './'
    test_file_path = os.path.join(tmpdir, test_file)
    with open(test_file_path, 'wb') as f:
        f.write(answer)
    with open(test_file_path, 'r', encoding='utf-8') as f:
        read_text = f.read()

    print("%s\n%s" % (read_text, answer.decode('utf-8')))
    assert(read_text != answer.decode('utf-8'))


if __name__ == '__main__':
    answer = u'Cap\\xit\xe1\x99n\n'.encode()
    level_27(answer)
