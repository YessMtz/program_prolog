% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: GENERA CODIGO GRAY DE N BITS, 
% ESTE PROGRAMA FUE DISEÑADO PARA PREVENIR  SEÑALES ILEGALES EN DISPOSITIVOS ELECTRONICOS, 
% DE TV PRIVADA Y ABIERTA
% ===============================================

% PROLOG - PROGRAMA 43
% ===============================================
% Genera el código Gray de N bits.

% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
gray(1, ['0', '1']).
gray(N, C) :- N > 1, N1 is N - 1, gray(N1, C1), maplist(atom_concat('0'), C1, C0), reverse(C1, C1R), maplist(atom_concat('1'), C1R, C1G), append(C0, C1G, C).



% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class GrayCodeGenerator
% {
%    // Método para generar el código Gray de N bits
%    public static List<string> GenerateGrayCode(int n)
%    {
%        if (n == 1)
%        {
%            return new List<string> { "0", "1" };
%        }
%        else if (n > 1)
%        {
%            // Recursivamente generar el código Gray para N - 1 bits
%            List<string> previousGrayCode = GenerateGrayCode(n - 1);

%            // Añadir '0' al inicio de cada código en la primera mitad
%            List<string> c0 = previousGrayCode.Select(code => "0" + code).ToList();

%            // Añadir '1' al inicio de cada código en la segunda mitad (inverso del anterior)
%            List<string> c1 = previousGrayCode.AsEnumerable().Reverse().Select(code => "1" + code).ToList();

%            // Combinar ambas mitades para formar el código Gray de N bits
%            c0.AddRange(c1);
%            return c0;
%        }
%        return new List<string>();
%    }

%    public static void Main()
%    {
%        // Ejemplo: Generar el código Gray para 3 bits
%        int n = 3;
%        List<string> grayCode = GenerateGrayCode(n);

%        Console.WriteLine($"Código Gray de {n} bits:");
%        foreach (string code in grayCode)
%        {
%            Console.WriteLine(code);
%        }
%    }
% }




