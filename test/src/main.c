#include <stdio.h>
#include <string.h>

typedef struct {
    int age;
    float height;
} Person;

void printPerson(Person p);

int main() {
    volatile Person person1;
    volatile int a = 10;
    person1.age = 30;
    person1.height = 1.75;

	person1.height = person1.age + person1.height;

    return 0;
}