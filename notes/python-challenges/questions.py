
#!/usr/bin/env python3

import ast
import base64
import codecs
import collections.abc
import io
import json
import keyword
import math
import numbers
import os
import pathlib
import platform
import re
import string
import sys
import tempfile
import textwrap
import threading
import traceback

import colorlabels as cl
import requests

# from flags import FLAG1, FLAG2, FLAG3, FLAG4, FLAG5
FLAG1, FLAG2, FLAG3, FLAG4, FLAG5 = 0, 0, 0, 0, 0

SOURCE = pathlib.Path(__file__).read_text(encoding='utf-8')

REMOTE_EXEC = False  # Tip: set to False for your local debugging
DEBUG_MODE = True  # Tip: set to True to display error traceback
GLOBAL_MAX_LENGTH = 100
CHALLENGE_TIMEOUT = 2


class ValidationError(Exception):
    pass


def check(expr):
    if not expr:
        raise ValidationError


class CheckRaises:
    def __init__(self, exc):
        check(issubclass(exc, BaseException))
        self.expect_exc = exc

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, tb):
        if exc_type is None:
            raise ValidationError(f'{self.expect_exc.__name__} not raised')
        if not issubclass(exc_type, self.expect_exc):
            raise ValidationError(f'{exc_type.__name__} raised')
        return True


def exec_code(code):
    if DEBUG_MODE:
        cl.plain(f'Code to execute:\n{code}')
    if REMOTE_EXEC:
        # Code will be sent to another server for execution. The execution environment also has
        # `ValidationError`, `check` and `CheckRaises` defined, so it should be functionally
        # equivalent as local execution.
        r = requests.post('http://backend:5000/exec', data={'code': code})
        r.raise_for_status()
        if DEBUG_MODE:
            cl.plain(f'Response: {r.text}')
        check(r.text == 'success')
    else:
        # Local execution for debugging.
        exec(code, {  # pylint: disable=exec-used # nosec
            'ValidationError': ValidationError,
            'check': check,
            'CheckRaises': CheckRaises,
        })


def check_different_answers_at_least(expr, n):
    check(isinstance(expr, collections.abc.Sequence))
    check(len(expr) >= n)
    check(len(set(map(repr, expr))) == len(expr))


def check_different_type_answers_at_least(expr, n):
    check(isinstance(expr, collections.abc.Sequence))
    check(len(expr) >= n)
    check(len(set(map(type, expr))) == len(expr))


def check_syntax_error(s):
    check(isinstance(s, str))
    with CheckRaises(SyntaxError):
        ast.parse(s)


def check_identifier(s):
    check(isinstance(s, str))
    check(s.isidentifier())
    check(s not in {'ValidationError', 'check', 'CheckRaises'})


def check_no_quotes(s):
    check(isinstance(s, str))
    check("'" not in s)
    check('"' not in s)


def check_names_with_spaces(s):
    check(isinstance(s, str))
    check(re.fullmatch(r'[0-9A-Za-z_ ]*', s))
    check('SystemExit' not in s)


def check_no_special_characters(s):
    check(isinstance(s, str))
    check(not re.search(r"""[()\[\]{}'"\\_#.\s]""", s))


def global_check(s):
    check(len(s) <= GLOBAL_MAX_LENGTH)


def bye():
    cl.newline()
    cl.warning('Bye~', mark='~')
    sys.exit(0)


def die(msg):
    cl.error(msg)
    if threading.active_count() > 1:
        # We need os._exit() to terminate all threads.
        os._exit(1)  # pylint: disable=protected-access
    else:
        sys.exit(1)


# Start of levels

def level_1(answer):
    check(answer == 'Life is short. I use Python.')


def level_2(answer):
    check(isinstance(answer, list))
    check(len(answer) == 2)
    check(isinstance(answer[0], tuple))
    check(len(answer[0]) == 1)
    check(answer[0][0] == {666})
    check(isinstance(answer[1], dict))
    check(len(answer[1]) == 1)
    for key, value in answer[1].items():
        check(key == 77.7)
        check(value == '888')


def level_3(answer):
    check_different_type_answers_at_least(answer, 2)
    for ans in answer:
        check(isinstance(ans, collections.abc.Iterable))
        check(not isinstance(ans, collections.abc.Sequence))
        check(6 in ans)


def level_4(answer):
    check_different_answers_at_least(answer, 2)
    check(all(ord(ans) == 54 for ans in answer))


def level_5(answer):
    check_different_answers_at_least(answer, 7)
    for ans in answer:
        check(not isinstance(ans, numbers.Number))
        check(not ans)


def level_6(answer):
    check(isinstance(answer, str))
    check(answer.count('+') > 1)
    check(isinstance(ast.literal_eval(answer), numbers.Number))


def level_7(answer):
    check_different_answers_at_least(answer, 4)
    check(all(ans[0] == '6' for ans in answer))


def level_8(answer):
    check_different_answers_at_least(answer, 4)
    check(all(ans[0] == 6 for ans in answer))


def level_9(answer):
    check_different_answers_at_least(answer, 4)
    check(not any(ans | ans for ans in answer))


def level_10(answer):
    check_different_answers_at_least(answer, 6)
    check(
        not any(re.search(r'''[\d()\[\]{}'"+-]''', repr(ans)) for ans in answer))


def level_11(answer):
    check_identifier(answer)
    check(not re.search(r'[0-9A-Za-z_]', answer))


def level_12(answer):
    check(isinstance(answer, str))
    x = json.loads(answer)
    check(x != x)  # pylint: disable=comparison-with-itself
    check([x] == [x])


def level_13(answer):
    check_no_quotes(answer)
    check('_' in answer)
    ast.literal_eval(answer)


def level_14(answer):
    check(isinstance(answer, str))
    check(re.fullmatch(r'[0-9:,{}]+', answer))
    check(re.search(r'\b666\b', answer))
    obj = ast.literal_eval(answer)
    check(isinstance(obj, dict))
    for key, value in obj.items():
        check(isinstance(key, int))
        check(isinstance(value, int))
        check(key != 666)
        check(value != 666)


def level_15(answer):
    check_no_quotes(answer)
    check(len(set(x.lower() for x in answer if x in string.ascii_letters)) >= 15)
    ast.literal_eval(answer)


def level_16(answer):
    check(isinstance(answer, str))
    check('awesome' not in answer)
    check(ast.literal_eval(answer) == 'awesome')


def level_17(answer):
    check(isinstance(answer, str))
    check(answer in string.whitespace)
    check_syntax_error(f'(1{answer},{answer}2)')


def level_18(answer):
    check(isinstance(answer, str))
    check(answer.isprintable())
    check("'" not in answer)
    check_syntax_error(f"x = r'{answer}'")


def level_19(answer):
    check_no_quotes(answer)
    check_syntax_error(f'f"{{{answer!r}}}"')


def level_20(answer):
    x, y, z1, z2 = answer
    check(all(isinstance(ans, str) for ans in answer))
    check(all(c in string.digits for c in x))
    check_syntax_error(x)
    check(float(y) > 0)
    with CheckRaises(ValueError):
        ast.literal_eval(y)
    check_different_type_answers_at_least(
        list(map(ast.literal_eval, [z1, z2])), 2)
    for z in [z1, z2]:
        check(len(z) <= 5)
        zz = ast.literal_eval(z)
        check(isinstance(zz, numbers.Number))
        with CheckRaises(ValueError):
            type(zz)(z)


def level_21(answer):
    check(isinstance(answer, bytes))
    check(not re.fullmatch(r'[0-9A-Za-z+/]*',
                           base64.encodebytes(answer).decode().rstrip('\n')))


def level_22(answer):
    a, b, c, d = answer
    check(isinstance(a, str))
    check(isinstance(b, str))
    check(isinstance(c, bytes))
    check(isinstance(d, str))
    with CheckRaises(LookupError):
        a.encode(b)
    codecs.encode(a, b)
    with CheckRaises(LookupError):
        c.decode(d)
    codecs.decode(c, d)


def level_23(answer):
    check('%s' % answer != str(answer))


def level_24(answer):
    check(isinstance(answer, str))
    answer_bytes = answer.encode('ascii')
    check(answer.splitlines() != [x.decode('ascii')
                                  for x in answer_bytes.splitlines()])


def level_25(answer):
    check(isinstance(answer, str))
    check(answer.swapcase().swapcase() != answer)


def level_26(answer):
    check(not re.search(r'[().eE]', repr(answer)))
    check(json.loads(json.dumps(answer)) != answer)


def level_27(answer):
    check(isinstance(answer, bytes))
    test_file = 'test.txt'
    with tempfile.TemporaryDirectory() as tmpdir:
        test_file_path = os.path.join(tmpdir, test_file)
        with open(test_file_path, 'wb') as f:
            f.write(answer)
        with open(test_file_path, 'r', encoding='utf-8') as f:
            read_text = f.read()
    check(read_text != answer.decode('utf-8'))


def level_28(answer):
    s, newline = answer
    check(s)
    check(newline)
    with io.StringIO(s, newline=newline) as f:
        lines = f.readlines()
    check(''.join(lines) != s)


def level_29(answer):
    check(isinstance(answer, str))
    check(not re.fullmatch(r'.*', answer))


def level_30(answer):
    check(isinstance(answer, str))
    check(answer != 'awesome')
    check(re.match(r'awesome$', answer))


def level_31(answer):
    check(isinstance(answer, str))
    check(re.sub(r'\{name\}', answer, 'Your name: {name}')
          != f'Your name: {answer}')


def level_32(answer):
    check(isinstance(answer, str))
    check(re.fullmatch(r'\d+', answer))
    check(answer[0] != '0')
    check(int(answer) == 0)


def level_33(answer):
    ans1, ans2 = answer
    check(len(set(ans1 + ans2)) == len(ans1 + ans2))
    for ans in answer:
        check_no_special_characters(ans)
        check_syntax_error(ans)
        ast.parse(f'({ans})')


def level_34(answer):
    check_names_with_spaces(answer)
    exec_code(textwrap.dedent(f'''\
        {answer}
        y = x
    '''))


def level_35(answer):
    check_different_answers_at_least(answer, 2)
    for ans in answer:
        check_identifier(ans)
        exec_code(textwrap.dedent(f'''\
            check({ans}({ans}) is True)
        '''))


def level_36(answer):
    check_identifier(answer)
    exec_code(textwrap.dedent(f'''\
        check({answer}({answer}) is {answer})
    '''))


def level_37(answer):
    check_different_answers_at_least(answer, 2)
    for ans in answer:
        x, y = ans
        check_identifier(x)
        check_identifier(y)
        check(x < y)
        exec_code(textwrap.dedent(f'''\
            check({x}({y}) is {y}({x}))
        '''))


def level_38(answer):
    check_identifier(answer)
    exec_code(textwrap.dedent(f'''\
        {answer}[{answer}]
    '''))


def level_39(answer):
    x, y = answer
    check_identifier(x)
    check_identifier(y)
    check(x != y)
    exec_code(textwrap.dedent(f'''\
        check(isinstance({x}, {x}))
        check(isinstance({y}, {y}))
        check(isinstance({x}, {y}))
        check(isinstance({y}, {x}))
        check(issubclass({x}, {y}))
    '''))


def level_40(answer):
    x, y, z = answer
    check_identifier(x)
    check_identifier(y)
    check_identifier(z)
    exec_code(textwrap.dedent(f'''\
        from collections.abc import *
        from numbers import *
        check(issubclass({x}, {y}))
        check(issubclass({y}, {z}))
        check(not issubclass({x}, {z}))
    '''))


def level_41(answer):
    check(isinstance(answer, str))
    check(re.fullmatch(r'[0-9,\s]+', answer))
    exec_code(textwrap.dedent(f'''\
        eval({answer!r})
        with CheckRaises(SyntaxError):
            exec({answer!r})
    '''))


def level_42(answer):
    ans1, ans2 = answer
    check_no_special_characters(ans1)
    check_no_special_characters(ans2)
    exec_code(textwrap.dedent(f'''\
        def foo(x, {ans1}y):
            pass
        foo(1, y=2)
        with CheckRaises(TypeError):
            foo(1, 2)
        def bar(x, {ans2}y):
            pass
        bar(1, y=2)
        with CheckRaises(TypeError):
            bar(x=1, y=2)
    '''))


def level_43(answer):
    ans1, ans2 = answer
    for ans in answer:
        check_no_special_characters(ans)
        check(re.findall(r'\w+', ans) == ['x', 'y'])
    exec_code(textwrap.dedent(f'''\
        x = ['66', '77']
        y = ['88', '99']
        z = [{ans1}]
        check(z == ['66', '77', '88', '99'])
        x = {{'foo': 'bar'}}
        y = {{'boo': 'baz'}}
        z = {{{ans2}}}
        check(z == {{'foo': 'bar', 'boo': 'baz'}})
    '''))


def level_44(answer):
    check_names_with_spaces(answer)
    exec_code(textwrap.dedent(f'''\
        with CheckRaises(NameError):
            x = 666
            try:
                1 / 0
            {answer}:
                pass
            z = 777
            y = x
        check(z == 777)
    '''))


def level_45(answer):
    check(all(isinstance(ans, str) for ans in answer))
    check_different_type_answers_at_least(
        list(map(ast.literal_eval, answer)), 3)
    for ans in answer:
        exec_code(textwrap.dedent(f'''\
            with CheckRaises(Exception):
                exec({f"{ans}.__class__"!r})
        '''))


def level_46(answer):
    check_different_answers_at_least(answer, 5)
    for ans in answer:
        check_no_special_characters(ans)
        check(re.findall(r'\w+', ans) == ['secret'])
        exec_code(textwrap.dedent(f'''\
            secret = 'my_super_secret'
            check("'" in f'{{{ans}}}')
        '''))


def level_47(answer):
    check(isinstance(answer, str))
    check(re.fullmatch(r'[0-9A-Za-z"]+', answer))
    check(answer.count('"') == 6)
    check(answer.count('"""') == 2)
    check(len(answer) >= 12)
    exec_code(textwrap.dedent(f'''\
        def foo():
            {answer}
            check(isinstance({answer}, str))
        check(not foo.__doc__)
        foo()
    '''))


def level_48(answer):
    check_identifier(answer)
    check(not keyword.iskeyword(answer))
    code = textwrap.dedent(f'''\
        class A:
            pass
        A.{answer} = 666
    ''')
    exec_code(textwrap.dedent(f'''\
        with CheckRaises(SyntaxError):
            exec({code!r})
    '''))


def level_49(answer):
    x, y = answer
    check_identifier(x)
    check_identifier(y)
    check(x != y)
    exec_code(textwrap.dedent(f'''\
        class A:
            {x} = 666
            check({y} == 666)
        check(A.__dict__.get({x!r}) is None)
        class A:
            def foo({x}):
                return {y}
            check(foo(777) == 777)
    '''))


def level_50(answer):
    check_different_answers_at_least([ans[1] for ans in answer], 3)
    check(len(answer[0][1]) <= 2)
    check(len(answer[1][1]) <= 2)
    check(not answer[0][0])
    check(not answer[2][0])
    for ans in answer:
        prefix, op = ans
        check_names_with_spaces(prefix)
        check_no_special_characters(op)
        exec_code(textwrap.dedent(f'''\
            {prefix}
            def bomb():
                1 / 0  # bomb triggered
            x = 666
            x {op} bomb()
        '''))


# End of levels

level_numbers = [int(name[6:])
                 for name in globals() if name.startswith('level_')]
NUM_LEVELS = len(level_numbers)
if sorted(level_numbers) != list(range(1, NUM_LEVELS + 1)):
    raise RuntimeError('level number configuration error')


def get_input(prompt):
    try:
        data = cl.input(prompt)
    except EOFError:
        bye()
    except UnicodeDecodeError:
        die('Bad input!')
    else:
        return data


def get_level_number():
    while True:
        level_number = get_input('Level: ')
        try:
            global_check(level_number)
            level_number = int(level_number)
            check(0 <= level_number <= NUM_LEVELS)
        except (ValidationError, ValueError):
            cl.error('Invalid level number')
            continue
        return level_number


def get_callback():
    while True:
        callback = get_input('Callback: ')
        try:
            global_check(callback)
            check_identifier(callback)
        except ValidationError:
            cl.error('Invalid callback')
            continue
        return callback


def check_milestones(level_status):
    levels_solved = sum(level_status)
    if levels_solved == NUM_LEVELS:
        cl.success(FLAG5)
        cl.newline()
        win()
    elif levels_solved == round(0.8 * NUM_LEVELS):  # pylint: disable=round-builtin
        cl.success(FLAG4)
    elif levels_solved == round(0.6 * NUM_LEVELS):  # pylint: disable=round-builtin
        cl.success(FLAG3)
    elif levels_solved == round(0.4 * NUM_LEVELS):  # pylint: disable=round-builtin
        cl.success(FLAG2)
    elif levels_solved == round(0.2 * NUM_LEVELS):  # pylint: disable=round-builtin
        cl.success(FLAG1)


def show_level_block(level_number, field_width, status):
    color = cl.BRIGHT_GREEN if status else cl.BRIGHT_RED
    mark = '+' if status else '-'
    return f'{color}[{mark} {level_number:0{field_width}} {mark}]{cl.COLOR_RESET}'


def show_level_stats(level_status, items_per_row=5):
    cl.newline()
    cl.section('Level stats:')
    field_width = len(str(NUM_LEVELS))
    rows = math.ceil(NUM_LEVELS / items_per_row)
    for row in range(rows):
        cl.info(' '.join(show_level_block(x + 1, field_width, level_status[x])
                         for x in range(row * items_per_row,
                                        min((row + 1) * items_per_row, NUM_LEVELS))))
    cl.progress(f'Your progress: {sum(level_status)}/{NUM_LEVELS}')
    check_milestones(level_status)
    cl.newline()


def rainbow_fart():
    for color in (cl.BRIGHT_RED, cl.BRIGHT_YELLOW, cl.BRIGHT_GREEN,
                  cl.BRIGHT_BLUE, cl.BRIGHT_CYAN, cl.BRIGHT_MAGENTA):
        cl.plain('You awesome!', color=color, mark='~')


def win():
    cl.success('Congratulations! You solved all the challenges!')
    cl.info("Now here is a gift for you. You can choose a callback function to call "
            "(e.g. try 'rainbow_fart')! Hope you can find the final flag through this!")
    callback = get_callback()
    cl.progress(f'Executing callback {callback!r} for you...')
    exec(f'{callback}()')  # pylint: disable=exec-used # nosec
    bye()


PYTHON_VERSION = platform.python_version()
try:
    exec_code(textwrap.dedent(f'''\
        import platform
        check(platform.python_version() == {PYTHON_VERSION!r})
    '''))
except ValidationError:
    raise RuntimeError(
        'backend Python version is different, please check configuration') from None


def main():
    cl.section('Welcome to Python Challenges')
    cl.info(f'Python version: {PYTHON_VERSION}')
    level_status = [False] * NUM_LEVELS
    while True:
        show_level_stats(level_status)

        cl.info(f'Enter a level number (1-{NUM_LEVELS}) to solve a level, '
                'or enter 0 to view source code')
        level_number = get_level_number()

        if level_number == 0:
            print(SOURCE, end='')
            continue

        if level_status[level_number - 1]:
            cl.success('You already solved this level')
            continue

        level_func = globals()[f'level_{level_number}']
        answer = get_input(f'Your answer for level {level_number}: ')

        timer = threading.Timer(CHALLENGE_TIMEOUT, die, args=('Timeout!',))
        timer.start()

        try:
            global_check(answer)
            answer = ast.literal_eval(answer.strip())
        except Exception:  # pylint: disable=broad-except
            timer.cancel()
            cl.error('Wrong answer')
            if DEBUG_MODE:
                traceback.print_exc(file=sys.stdout)
            continue

        try:
            level_func(answer)
        except Exception:  # pylint: disable=broad-except
            timer.cancel()
            cl.error('Wrong answer')
            if DEBUG_MODE:
                traceback.print_exc(file=sys.stdout)
            continue

        timer.cancel()
        cl.success('Correct answer')
        level_status[level_number - 1] = True


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        bye()
