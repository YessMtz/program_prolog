% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

%using System;
% class Program
% {
%    // Calcula el máximo común divisor (MCD) usando el algoritmo de Euclides.
%    static int GCD(int x, int y)
%    {
%        return y == 0 ? x : GCD(y, x % y);
%    }
%    // Verifica si dos números son coprimos.
%    static bool AreCoprime(int x, int y)
%    {
%        return GCD(x, y) == 1;
%    }
%    static void Main()
%    {
%        // Ejemplo de uso
%        int x = 14;
%        int y = 25;
%        if (AreCoprime(x, y))
%        {
%            Console.WriteLine($"{x} y {y} son coprimos.");
%        }
%        else
%        {
%            Console.WriteLine($"{x} y {y} no son coprimos.");
%        }
%    }
% }
