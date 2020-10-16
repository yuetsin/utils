int data[22];
int encoding_table[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                            'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
                            'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                            'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
                            'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                            'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                            'w', 'x', 'y', 'z', '0', '1', '2', '3',
                            '4', '5', '6', '7', '8', '9', '+', '/'};

int m = 0;
while (m < 21) {
    data[m] = read_char();
    m = m + 1;
}

int input_length = 21;

int output_length = 28;

int encoded_data[40];

int i = 0;
int j = 0;

while (i < 21) {
    data[j] = encoding_table[data[i] / 4];
    data[j + 1] = encoding_table[((data[i] & 0x03) * 16) | (data[i + 1] / 16)];
    data[j + 2] = encoding_table[((data[i + 1] & 0x0f) * 4) | (data[i + 2] / 64)];
    data[j + 3] = encoding_table[data[i + 2] & 0x3f];
    i = i + 3;
    j = j + 4;
}
i = 0;
while (i < 28)
{
    write_char(encoded_data[i]);
}
