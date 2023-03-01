CC = g++
CFLAGS = -Wall -Wextra -std=c++17 -pthread
NUM_THREADS = 4
INPUT = file.in

build:
	$(CC) $(CFLAGS) jacobi.cpp -o jacobi
	$(CC) $(CFLAGS) gauss_seidel.cpp -o gauss_seidel
run:
	./jacobi $(NUM_THREADS) $(INPUT)
	./gauss_seidel $(INPUT)
clean:
	rm -f jacobi gauss_seidel
.PHONY: clean