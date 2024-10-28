% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: Comparar dos métodos para calcular la función totiente de Euler.
% ===============================================

% PROLOG - PROGRAMA 37
% ===============================================
% Método básico para calcular la función totiente
totient(N, Phi) :-
    findall(X, (between(1, N, X), coprime(X, N)), Coprimes),
    length(Coprimes, Phi).

% Comprueba si dos números son coprimos
coprime(A, B) :- gcd(A, B, G), G =:= 1.

% Cálculo del máximo común divisor (MCD)
gcd(0, B, B).
gcd(A, 0, A).
gcd(A, B, G) :- A > B, A1 is A - B, gcd(A1, B, G).
gcd(A, B, G) :- A =< B, B1 is B - A, gcd(A, B1, G).

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

% Calcula la función φ de Euler utilizando los factores primos con multiplicidad
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% Compara los dos métodos para calcular la función totiente
compare_totient(N) :- 
    totient(N, Phi1), 
    totient_improved(N, Phi2), 
    write('Phi (método básico): '), write(Phi1), nl, 
    write('Phi (método mejorado): '), write(Phi2), nl.



% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class TotientCalculator
% {
%    // Método principal para calcular la función totiente usando el método básico
%    public static int Totient(int n)
%    {
%        return Enumerable.Range(1, n).Count(x => IsCoprime(x, n));
%    }

%    // Comprueba si dos números son coprimos
%    private static bool IsCoprime(int a, int b)
%    {
%        return GCD(a, b) == 1;
%    }

%    // Cálculo del máximo común divisor (MCD)
%    private static int GCD(int a, int b)
%    {
%        while (b != 0)
%        {
%            int temp = b;
%            b = a % b;
%            a = temp;
%        }
%        return a;
%    }

%    // Método mejorado para calcular la función totiente
%    public static int TotientImproved(int n)
%    {
%        var primeFactorsWithMultiplicity = GetPrimeFactorsWithMultiplicity(n);
%        return CalculateTotient(primeFactorsWithMultiplicity);
%    }

%    // Método para obtener la lista de factores primos junto con su multiplicidad
%    private static List<(int Factor, int Multiplicity)> GetPrimeFactorsWithMultiplicity(int n)
%    {
%        var factors = GetPrimeFactors(n);
%        return Encode(factors);
%    }

%    // Método para obtener los factores primos de un número sin multiplicidad
%    private static List<int> GetPrimeFactors(int n)
%    {
%        var factors = new List<int>();
%        int factor = 2;

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
%    }
%    // Método para encontrar el siguiente factor
%    private static int NextFactor(int f)
%    {
%        return f == 2 ? 3 : f + 2;
%    }

%    // Método para agrupar los factores primos con su multiplicidad
%    private static List<(int Factor, int Multiplicity)> Encode(List<int> factors)
%    {
%        return factors
%            .GroupBy(f => f)
%            .Select(g => (Factor: g.Key, Multiplicity: g.Count()))
%            .ToList();
%    }

%    // Método para calcular la función totiente usando la lista de factores primos con multiplicidad
%    private static int CalculateTotient(List<(int Factor, int Multiplicity)> factorsWithMultiplicity)
%    {
%        int totient = 1;

%        foreach (var (factor, multiplicity) in factorsWithMultiplicity)
%        {
%            // Aplica la fórmula φ(N) = Π [(P - 1) * P^(M - 1)]
%            totient *= (factor - 1) * (int)Math.Pow(factor, multiplicity - 1);
%        }

%        return totient;
%    }

%    // Método para comparar ambos métodos de cálculo
%    public static void CompareTotient(int n)
%    {
%        int phi1 = Totient(n);
%        int phi2 = TotientImproved(n);

%        Console.WriteLine($"Phi (método básico): {phi1}");
%        Console.WriteLine($"Phi (método mejorado): {phi2}");
%    }

%    public static void Main()
%    {
%        int number = 36; // Número para comparar
%        CompareTotient(number);
%    }
% }





