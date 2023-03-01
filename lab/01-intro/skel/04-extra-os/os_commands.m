% linia de "igiena"
% clc -> sterge toate comenzile de pe ecran
% close all -> inchide toate ferestrele grafice
% clear -> sterge toate variabilele din workspace

clc; close all; clear;

% comanda ls, invocata ca o functie: ls()
result_ls = ls();
disp(["Command ls's result: ", result_ls]);

% ne mutam in directorul parinte, ii luam calea absoluta si revenim
initial_directory = pwd();
cd("..");
current_directory = pwd();
cd(initial_directory);

disp(["Current directory is: ", current_directory])

% folosim comanda dir(), care in Unix primeste un folder name si
% returneaza o lista cu toate fisierele si atribute ale lor (struct list)
file_list = dir("/");
disp(["Your root has ", num2str(length(file_list)), " subdirectories and files"]);