#include <iostream>
#include <fstream>
#include <vector>
#include <pthread.h>
#include <string.h>
#include "utils.h"
#include <time.h>
#include <iomanip>

std::vector<pthread_t> threads;
pthread_barrier_t barrier;
double **mat;
double *prev_sol;
double *sol;
double *b;
double err = 0;

pthread_mutex_t mutex;
int n, num_threads;

void *perform_jacobi(void *args)
{
    int thread_id = *(int *)args;
    int steps = 0;
    int start = thread_id * (double)n / num_threads;
    int stop = std::min((thread_id + 1) * (double)n / num_threads, (double)n);

    while (1) {
        double local_err = 0;

        for (int i = start; i < stop; ++i) {
            sol[i] = 0;
            for (int j = 0; j < n; ++j) {
                if (j == i)
                    continue;
                sol[i] += mat[i][j] * prev_sol[j];
            }

            sol[i] = (b[i] - sol[i]) / mat[i][i];

            local_err += (sol[i] - prev_sol[i]) * (sol[i] - prev_sol[i]);
        }

        steps++;

        pthread_mutex_lock(&mutex);
        err += local_err;
        pthread_mutex_unlock(&mutex);
    
        pthread_barrier_wait(&barrier);

        if (err < SQUARED_ERR || steps == MAX_STEPS) {
            return NULL;
        }
        
        pthread_barrier_wait(&barrier);

        if (thread_id == 0) {
            err = 0;
            std::cout << "Step " << steps << "\n";
        }
        
        for (int i = start; i < stop; ++i)
            prev_sol[i] = sol[i];

        pthread_barrier_wait(&barrier);
    }

    return NULL;
}

int main(int argc, char **argv)
{
    if (argc != 3) {
        std::cerr << "Usage: ./jacobi num_threads input_file";
        return 1;
    }

    num_threads = atoi(argv[1]);
    std::string filename = std::string(argv[2]);

    std::ifstream fin(filename);
    fin >> n;

    prev_sol = new double[n];
    memset(prev_sol, 0, n * sizeof(double));

    sol = new double[n];
    b = new double[n];

    mat = new double *[n];
    for (int i = 0; i < n; ++i)
        mat[i] = new double[n];
    
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            fin >> mat[i][j];

    for (int i = 0; i < n; ++i)
        fin >> b[i];

    threads = std::vector<pthread_t>(num_threads);

    pthread_mutex_init(&mutex, NULL);
    pthread_barrier_init(&barrier, NULL, num_threads);

    clock_t start = clock();

    std::vector<int> thread_ids(num_threads, 0);

    for (int i = 0; i < num_threads; ++i) {
        thread_ids[i] = i;
        pthread_create(&threads[i], NULL, perform_jacobi, &thread_ids[i]);
    }

    void *status;

    for (int i = 0; i < num_threads; ++i) {
        pthread_join(threads[i], &status);
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
    pthread_mutex_destroy(&mutex);
    pthread_barrier_destroy(&barrier);
    delete[] sol;
    delete[] prev_sol;
    
    for (int i = 0; i < n; ++i)
        delete[] mat[i];
    delete[] mat;
    delete[] b;

    return 0;
}