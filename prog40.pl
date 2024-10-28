% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: Lista de composiciones de Goldbach para un rango de números.
% ===============================================

%PROLOG - PROGRAMA 40
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

% Encuentra una composición de Goldbach para un número par N
goldbach(N, [P1, P2]) :-
    N > 2,
    N mod 2 =:= 0,
    between(2, N, P1),
    is_prime(P1),
    P2 is N - P1,
    is_prime(P2),
    P1 =< P2.

% Encuentra las composiciones de Goldbach para todos los números pares en un rango dado
goldbach_list(Low, High, L) :-
    findall([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2])), L).



% ===============================================
% PROGRAMA EN C#
% ===============================================
%using System;
% using System.Collections.Generic;

% class GoldbachCalculator
% {
%    // Método para verificar si un número es primo
%    private static bool IsPrime(int n)
%    {
%        if (n <= 1) return false;
%        if (n == 2 || n == 3) return true;
%        if (n % 2 == 0) return false;

%        for (int i = 3; i * i <= n; i += 2)
%        {
%            if (n % i == 0) return false;
%        }

%        return true;
%    }

%    // Método para encontrar una composición de Goldbach para un número par N
%    private static (int, int)? Goldbach(int n)
%    {
%        if (n <= 2 || n % 2 != 0)
%            return null;

%        for (int p1 = 2; p1 <= n / 2; p1++)
%        {
%            int p2 = n - p1;
%            if (IsPrime(p1) && IsPrime(p2))
%            {
%                return (p1, p2);
%            }
%        }

%        return null;
%    }

%    // Método para encontrar las composiciones de Goldbach para todos los números pares en un rango dado
%    public static List<(int, int, int)> GoldbachList(int low, int high)
%    {
%        var results = new List<(int, int, int)>();

%        for (int n = low; n <= high; n++)
%        {
%            if (n % 2 == 0) // Solo pares
%            {
%                var composition = Goldbach(n);
%                if (composition.HasValue)
%               {
%                    results.Add((n, composition.Value.Item1, composition.Value.Item2));
%                }
%            }
%        }

%        return results;
%    }

%    public static void Main()
%    {
%        int low = 10;
%        int high = 20;

%        var results = GoldbachList(low, high);
%        foreach (var (n, p1, p2) in results)
%        {
%            Console.WriteLine($"{n} = {p1} + {p2}");
%        }
%    }
% }




