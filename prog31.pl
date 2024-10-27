% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% using System;
% class Program
% {
%    // Calcula el máximo común divisor (MCD) usando el algoritmo de Euclides.
%    static int GCD(int x, int y)
%    {
%        // Caso base: si y es 0, devuelve x.
%        if (y == 0)
%        {
%            return x;
%        }        
%        // Llamada recursiva: calcula GCD usando x % y.
%        return GCD(y, x % y);
%    }
%    static void Main()
%    {
%        // Ejemplo de uso
%        int x = 56;
%        int y = 98;
%        int gcd = GCD(x, y);       
%        Console.WriteLine($"El MCD de {x} y {y} es {gcd}");
%    }
% }
