#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
typedef uint8_t BYTE;

// Number of bytes in .wav header

int main(int argc, char *argv[])
{
    // Accept a single command-line argument
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    // Open the memory card

    FILE *card = fopen(argv[1], "r");
    if (card == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    unsigned char buffer[512];

    int count_image = 0;

    FILE *output_file = NULL;

    char *filename = malloc(8 * sizeof(char));

    // Create a buffer for a block of data

    // While there's still data left to read from the memory card

    while (fread(&buffer, sizeof(char), 512, card))
    {
        // Create JPEGs from the data
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff &&
            (buffer[3] & 0xf0) == 0xe0)
        {
            if (count_image > 0)
            {
                fclose(output_file);
            }

            sprintf(filename, "%03i.jpg", count_image);

            output_file = fopen(filename, "w");

            count_image++;
        }

        if (output_file != NULL)
        {
            fwrite(buffer, sizeof(char), 512, output_file);
        }
    }
    free(filename);
    fclose(output_file);
    fclose(card);

    return 0;
}
