% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: Conjetura de Goldbach.
% ===============================================

%PROLOG - PROGRAMA 39
% ===============================================
% Comprueba si un número es primo
is_prime(2).
is_prime(3).
is_prime(N) :-
    N > 3,
    N mod 2 =\= 0,
    \+ has_factor(N, 3).

% Verifica si N tiene un factor en el rango
has_factor(N, F) :-
    N mod F =:= 0.
has_factor(N, F) :-
    F * F < N,
    F2 is F + 2,
    has_factor(N, F2).

% Genera una lista de números primos en un rango dado
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).


% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;
% using System.Collections.Generic;

% class PrimeGenerator
% {
%    // Método para generar una lista de números primos en un rango dado
%    public static List<int> PrimeList(int low, int high)
%    {
%        var primes = new List<int>();
%        for (int i = low; i <= high; i++)
%        {
%            if (IsPrime(i))
%            {
%                primes.Add(i);
%            }
%        }
%        return primes;
%    }

%    // Comprueba si un número es primo
%    private static bool IsPrime(int n)
%    {
%        if (n <= 1) return false;
%        if (n == 2 || n == 3) return true;
%        if (n % 2 == 0) return false;
%        return !HasFactor(n, 3);
    }

%    // Verifica si el número N tiene un factor en el rango
%    private static bool HasFactor(int n, int f)
%    {
%        while (f * f <= n)
%        {
%            if (n % f == 0) return true;
%            f += 2;
%        }
%        return false;
%    }

%    public static void Main()
%    {
%        int low = 10;
%        int high = 50;

%        List<int> primes = PrimeList(low, high);
%        Console.WriteLine($"Primos entre {low} y {high}: {string.Join(", ", primes)}");
%    }
% }


