% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: PROGRAMA EN PROLOG QUE IMPRIME FACTORES PRIMOS DE UN NUMERO
% ===============================================

%PROLOG - PROGRAMA 35
% ===============================================
% Encuentra los factores primos de un número
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).
prime_factors(N, F, [N]) :- N > 1, F * F > N.

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Agrupa elementos consecutivos en pares [Elemento, Multiplicidad]
encode([], []).
encode([H|T], [[H, Count]|EncodedTail]) :- count(H, [H|T], Count, Rest), encode(Rest, EncodedTail).

% Cuenta la cantidad de veces que un elemento aparece al inicio de una lista
count(_, [], 0, []).
count(X, [X|T], Count, Rest) :- count(X, T, Count1, Rest), Count is Count1 + 1.
count(X, [Y|T], 0, [Y|T]) :- X \= Y.

% Determina los factores primos con su multiplicidad
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class PrimeFactorsWithMultiplicity
% {
%    // Método principal para obtener los factores primos con su multiplicidad
%    public static List<(int Factor, int Multiplicity)> GetPrimeFactorsWithMultiplicity(int n)
%    {
%        List<int> primeFactors = GetPrimeFactors(n);
%        return Encode(primeFactors);
%    }

%    // Método para obtener la lista de factores primos sin multiplicidad
%    private static List<int> GetPrimeFactors(int n)
%    {
%        var factors = new List<int>();
%        int factor = 2;
%
%        while (n > 1)
%        {
%            if (n % factor == 0)
%            {
%                factors.Add(factor);
%                n /= factor;
%            }
%            else
%            {
%                factor = NextFactor(factor);
%            }
%        }
%        return factors;
%    }   // Método para encontrar el siguiente factor (incrementa en 1 si es 2, o en 2 si es impar)
%    private static int NextFactor(int f)
%    {
%        return f == 2 ? 3 : f + 2;
%    }
%    // Método para agrupar los factores primos con sus multiplicidades
%    private static List<(int Factor, int Multiplicity)> Encode(List<int> factors)
%    {
%        return factors
%            .GroupBy(f => f)
%            .Select(g => (Factor: g.Key, Multiplicity: g.Count()))
%            .ToList();
%    }
%    // Método principal de prueba
%    public static void Main()
%    {
%        int number = 56;  // Número a factorizar
%        var factorsWithMultiplicity = GetPrimeFactorsWithMultiplicity(number);
%
%        Console.WriteLine($"Prime factors of {number} with multiplicities:");
%        foreach (var (factor, multiplicity) in factorsWithMultiplicity)
%        {
%            Console.WriteLine($"{factor}^{multiplicity}");
%        }
%    }
% }


