#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);

int main(void)
{
    // prompt the user for two words
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // computer the score of each word
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // print the winner
    if (score1 > score2)
    {
        printf("Player 1 wins!\n");
    }
    else if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    else if (score1 == score2)
    {
        printf("Tie!\n");
    }
}

int compute_score(string word)
{
    int score = 0;

    for (int i = 0, len = strlen(word); i < len; i++)
    {
        if (word[i] >= 'a' && word[i] <= 'z')
        {
            score = score + POINTS[word[i] - 'a'];
        }
        else if (word[i] >= 'A' && word[i] <= 'Z')
        {
            score = score + POINTS[word[i] - 'A'];
        }
    }
    return score;
}
