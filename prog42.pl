% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: PROGRAMA QUE GENERA 
% UNA TABLA DE VERDAD PARA EXPRESIONES LOGICAS(OPERADORES)
% ===============================================

% PROLOG - PROGRAMA 42
% ===============================================
 % Utiliza operadores lógicos para definir expresiones y generar tablas de verdad.
% Definición de los operadores básicos AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.



% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;

% class TruthTableGenerator
% {
%    // Operador AND
%    private static bool And(bool a, bool b) => a && b;

%    // Operador OR
%    private static bool Or(bool a, bool b) => a || b;

%    // Operador NAND
%    private static bool Nand(bool a, bool b) => !(a && b);

%    // Operador NOR
%    private static bool Nor(bool a, bool b) => !(a || b);

%    // Operador XOR
%    private static bool Xor(bool a, bool b) => a ^ b;

%    // Operador de implicación
%    private static bool Impl(bool a, bool b) => !a || b;

%    // Operador de equivalencia
%    private static bool Equ(bool a, bool b) => a == b;

%    // Método para generar una tabla de verdad para una expresión lógica
%    public static void Table(Func<bool, bool, bool> expr, string operationName)
%    {
%        bool[] values = { true, false };

%        Console.WriteLine($"Tabla de verdad para {operationName}:");
%        Console.WriteLine("A\tB\tResult");
        
%        foreach (var A in values)
%        {
%            foreach (var B in values)
%            {
%                bool result = expr(A, B);
%                Console.WriteLine($"{A}\t{B}\t{result}");
%            }
%        }
%        Console.WriteLine();
%    }

%    public static void Main()
%    {
%        // Ejemplo de uso: generar tablas de verdad para varias expresiones lógicas
%        Table(And, "AND");
%        Table(Or, "OR");
%        Table(Nand, "NAND");
%        Table(Nor, "NOR");
%        Table(Xor, "XOR");
%        Table(Impl, "Implicación");
%        Table(Equ, "Equivalencia");
%    }
% }






