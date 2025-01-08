#include <cs50.h>
#include <stdio.h>

int get_cents(void);
int calculate_quarters(int cents);
int calculate_dimes(int cents);
int calculate_nickels(int cents);
int calculate_pennies(int cents);

int main(void)
{

    // Prompt the user for change owed, in cents
    int cents = get_cents();

    // Calculate how many quarters you should give customer
    int quarters = calculate_quarters(cents);
    cents = cents - quarters * 25;

    // Calculate how many dimes you should give customer
    int dimes = calculate_dimes(cents);
    cents = cents - dimes * 10;

    // Calculate how many nickels you should give customer
    int nickels = calculate_nickels(cents);
    cents = cents - nickels * 5;

    // Calculate how many pennies you should give customer
    int pennies = calculate_pennies(cents);
    cents = cents - pennies * 1;

    // Sum the number of quarters, dimes, nickels, and pennies used
    int coins = quarters + dimes + nickels + pennies;

    // Print that sum
    printf("num coins: %i\n", coins);
}

int get_cents(void)
{
    int cents;

    do
    {
        cents = get_int("Change owed: ");
    }
    while (cents < 0);
    return (cents);
}

int calculate_quarters(int cents)
{
    int quarters = 0;
    while (cents >= 25)
    {
        cents = cents - 25;
        quarters++;
    }
    return quarters;
}

int calculate_dimes(int cents)
{
    int dimes = 0;
    while (cents >= 10)
    {
        cents = cents - 10;
        dimes++;
    }
    return dimes;
}

int calculate_nickels(int cents)
{
    int nickels = 0;
    while (cents >= 5)
    {
        cents = cents - 5;
        nickels++;
    }
    return nickels;
}
int calculate_pennies(int cents)
{
    int pennies = 0;
    while (cents >= 1)
    {
        cents = cents - 1;
        pennies++;
    }
    return pennies;
}
