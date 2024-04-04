#include <stdio.h>

#define A_ROWS 2
#define A_COLS 4
#define B_ROWS 4
#define B_COLS 2

int main(int argc, char** argv)
{
    // User goofed with matrix dimensions, stop execution
    if(A_COLS != B_ROWS)
        return 1;

    // Matrices used as part of the multiplication operation
    int matrix_a[A_ROWS][A_COLS],
        matrix_b[B_ROWS][B_COLS],
        matrix_r[A_ROWS][B_COLS];

    // Blank init results matrix
    for(unsigned int i = 0; i < A_ROWS; i++)
    {
        for(unsigned int j = 0; j < B_COLS; j++)
        {
            matrix_r[i][j] = 0;
        }
    }

    // Init matrix A
    //printf("\nMATRIX A:");
    for(unsigned int i = 0; i < A_ROWS; i++)
    {
        //printf("\n");
        for(unsigned int j = 0; j < A_COLS; j++)
        {
            matrix_a[i][j] = (i+j);
            //printf("%2d ", matrix_a[i][j]);
        }
    }

    // Init matrix B
    //printf("\nMATRIX B:");
    for(unsigned int i = 0; i < B_ROWS; i++)
    {
        //printf("\n");
        for(unsigned int j = 0; j < B_COLS; j++)
        {
            matrix_b[i][j] = (i-j);
            //printf("%2d ", matrix_b[i][j]);
        }
    }

    // Multiply [A] * [B]
    //printf("\nRESULT:");
    for(unsigned int i = 0; i < A_ROWS; i++)
    {
        //printf("\n");
        for(unsigned int j = 0; j < B_COLS; j++)
        {
            for(unsigned int k = 0; k < B_ROWS; k++)
            {
                matrix_r[i][j] += matrix_a[i][k] * matrix_b[k][j];
            }
            //printf("%2d ", matrix_r[i][j]);
        }
    }

    //printf("\n");
    fflush(stdout);
    return 0;
}
