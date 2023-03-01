#include <iostream>
#include "utils.h"
#include <fstream>
#include <vector>
#include <string.h>
#include <time.h>
#include <iomanip>

int main(int argc, char **argv)
{
    if (argc != 2) {
        std::cerr << "Usage: ./gauss_seidel num_threads input_file" << "\n";
        return 1;
    }

    std::string filename(argv[1]);
    std::ifstream fin(filename);

    int n;
    fin >> n;

    double *b = new double[n];
    double *sol = new double[n];
    double **mat = new double *[n];
    for (int i = 0; i < n; ++i)
        mat[i] = new double[n];
    
    memset(sol, 0, n * sizeof(double));

    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            fin >> mat[i][j];
    
    for (int i = 0; i < n; ++i)
        fin >> b[i];

    clock_t start = clock();

    double err;

    int steps = 0;

    while (1) {
        err = 0;

        for (int i = 0; i < n; ++i) {
            double acc = 0;

            for (int j = 0; j < n; ++j) {
                if (j == i)
                    continue;

                acc += mat[i][j] * sol[j];
            }

            double temp = sol[i];
            sol[i] = (b[i] - acc) / mat[i][i];
        
            err += (sol[i] - temp) * (sol[i] - temp);
        }
        steps++;

        std::cout << "Step " << steps << "\n";

        if (err < SQUARED_ERR || steps == MAX_STEPS)
            break;
    }

    clock_t end = clock();

    double elapsed_time = (end - start) / CLOCKS_PER_SEC;
    double final_err = 0;

    for (int i = 0; i < n; ++i) {
        double val = 0;
        for (int j = 0; j < n; ++j)
            val += mat[i][j] * sol[j];
        final_err += (val - b[i]) * (val - b[i]);
    }

    std::cout << "Time elapsed: " << std::fixed << std::setprecision(10) << elapsed_time << " seconds" << "\n";
    std::cout << "Error " << final_err << "\n";

    fin.close();
    delete[] b;
    delete[] sol;
    for (int i = 0; i < n; ++i)
        delete[] mat[i];
    delete[] mat;

    return 0;
}