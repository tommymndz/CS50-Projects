#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    for (int i = 0, len = strlen(argv[1]); i < len; i++)
    {
        if (!isdigit(argv[1][i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    int k = atoi(argv[1]);

    string plaintext = get_string("Plaintext: ");
    printf("Ciphertext: ");

    for (int j = 0, len = strlen(plaintext); j < len; j++)
    {
        if (isupper(plaintext[j]))
        {
            printf("%c", (plaintext[j] - 'A' + k) % 26 + 'A');
        }
        else if (islower(plaintext[j]))
        {
            printf("%c", (plaintext[j] - 'a' + k) % 26 + 'a');
        }
        else
        {
            printf("%c", plaintext[j]);
        }
    }
    printf("\n");
}
