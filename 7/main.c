#include <stdint.h>
#define ROWS 25
#define COLUMNS 80
#define ATTR 7
#define BUFFER_ADDR 0xB8000
#define STRUCT_SIZE 24

static char *buf = (char*) BUFFER_ADDR;

void put(int i, int j, char c)
{
    buf[2 * (i * COLUMNS + j)] = c;
    buf[2 * (i * COLUMNS + j) + 1] = ATTR;
}

void clear()
{
    for (int i = 0; i < ROWS; i++)
        for (int j = 0; j < COLUMNS; j++)
            put(i, j, ' ');
}

static int x, y;
static char memrng[] = "memory range: ";
static char ts[] = ", type ";

void put16(int j, int dg)
{
    if (dg < 10)
        put(y, j, '0' + dg);
    else
        put(y, j, 'a' + dg - 10);
}

void print(int64_t num)
{
    put(y, x++, '0');
    put(y, x++, 'x');
    if (num == 0)
    {
        put(y, x++, '0');
        return;
    }
    int64_t tmp = num;
    int len = 0;
    while (tmp)
    {
        len++;
        tmp /= 16;
    }
    x += len;
    for (int i = 0; i < len; i++)
    {
        put16(x - 1 - i, num % 16);
        num /= 16;
    }
}

void print10(int32_t num)
{
    if (num == 0)
    {
        put(y, x++, '0');
        return;
    }
    int32_t tmp = num;
    int len = 0;
    while (tmp)
    {
        len++;
        tmp /= 10;
    }
    x += len;
    for (int i = 0; i < len; i++)
    {
        put(y, x - 1 - i, '0' + num % 10);
        num /= 10;
    }
}

void printmem(char *ebx)
{
    int32_t *mmap = (int32_t*) (ebx + 44);
    clear();
    int32_t mmap_length = *mmap;
    mmap++;
    int32_t *mmap_address = (int32_t*) *mmap;
    y = 0;
    while (mmap_length > 0)
    {
        int64_t base_addr = (int64_t) *((int64_t*)(mmap_address + 1));
        int64_t end_addr = base_addr + (int64_t) *((int64_t*)(mmap_address + 3)) - 1;
        int32_t tp = (int32_t) *(mmap_address + 5);
        x = 0;
        for (uint32_t i = 0; i < sizeof(memrng) - 1; i++)
            put(y, x++, memrng[i]);
        print(base_addr);
        put(y, x++, '-');
        print(end_addr);
        for (uint32_t i = 0; i < sizeof(ts) - 1; i++)
            put(y, x++, ts[i]);
        print10(tp);
        mmap_address += STRUCT_SIZE / sizeof(int);
        mmap_length -= STRUCT_SIZE;
        y++;
    }
}
