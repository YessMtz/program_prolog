% PROGRAMA #30
% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \\+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

% using System;

% class PrimeChecker
% {
%    // Función principal para verificar si un número es primo
%    static bool IsPrime(int n)
%    {
%        if (n <= 1) return false;
%        if (n == 2 || n == 3) return true;
%        if (n % 2 == 0) return false;
%
%        return !HasFactor(n, 3);
%    }
%    // Función que verifica si hay factores
%    static bool HasFactor(int n, int factor)
%    {
%        if (n % factor == 0) return true;
%        if (factor * factor > n) return false;       
%        return HasFactor(n, factor + 2);
%    }
%    static void Main()
%    {
%        Console.Write("Ingrese un número: ");
%        int number = int.Parse(Console.ReadLine());
%
%        if (IsPrime(number))
%        {
%            Console.WriteLine($"{number} es primo.");
%        }
%        else
%        {
%            Console.WriteLine($"{number} no es primo.");
%        }
%    }
% }
