% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: El siguiente problema muestra 
% los factores primos de un numero entero positivo
% ===============================================

%PROLOG - PROGRAMA 34
% ===============================================
% Encuentra los factores primos de un número entero positivo.

prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;
% using System.Collections.Generic;
% class PrimeFactors
% {
%    public static List<int> GetPrimeFactors(int n)
%    {
%        var factors = new List<int>();
%        if (n <= 1)
%        {
%            return factors;
%        }
%        GetPrimeFactors(n, 2, factors);
%        return factors;
%    }
%    private static void GetPrimeFactors(int n, int f, List<int> factors)
%    {
%        // Base case: if n == 1, stop recursion
%        if (n == 1)
%        {
%            return;
%        }
%        // If `f` divides `n`, add it to factors and divide `n` by `f`
%        if (n % f == 0)
%        {
%            factors.Add(f);
%            GetPrimeFactors(n / f, f, factors);
%        }
%        // If `f` does not divide `n`, move to the next factor
%        else
%        {
%            int nextFactor = NextFactor(f);
%            GetPrimeFactors(n, nextFactor, factors);
%        }
%    }
%    private static int NextFactor(int f)
%    {
%        // If the factor is 2, move to 3; otherwise, increment by 2 (to skip even numbers)
%        return f == 2 ? 3 : f + 2;
%    }
% }
% class Program
% {
%    static void Main()
%    {
%        int number = 56;  // Test number
%        List<int> factors = PrimeFactors.GetPrimeFactors(number);
%        Console.WriteLine($"Prime factors of {number}: {string.Join(", ", factors)}");
%    }
% }


