% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: PROGRAMA PARA CONTAR HOJAS DE UN ARBOL
% ===============================================

%PROLOG - PROGRAMA 49
% ===============================================

% Cuenta el número de hojas en un árbol binario.
% Una hoja es un nodo sin hijos.
count_leaves(nil, 0).
count_leaves(t(_, nil, nil), 1).
count_leaves(t(_, L, R), N) :- count_leaves(L, NL), count_leaves(R, NR), N is NL + NR.

% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;

% class BinaryTree
% {
%    public object Value { get; set; }
%    public BinaryTree Left { get; set; }
%    public BinaryTree Right { get; set; }%    // Constructor para un nodo del árbol
%    public BinaryTree(object value, BinaryTree left = null, BinaryTree right = null)
%    {
%        Value = value;
%        Left = left;
%        Right = right;
%    }   // Cuenta el número de hojas en el árbol
%    public static int CountLeaves(BinaryTree node)
%    {
%        // Caso base: árbol vacío
%        if (node == null)
%            return 0;

%        // Caso de hoja: nodo sin hijos
%        if (node.Left == null && node.Right == null)
%            return 1;

%        // Contar hojas en los subárboles izquierdo y derecho
%        return CountLeaves(node.Left) + CountLeaves(node.Right);
%    }
% }

% class Program
% {
%    static void Main()
%    {        // Ejemplo de árbol binario
%        var tree = new BinaryTree("a",
%            new BinaryTree("b", null, null), // Hojas
%            new BinaryTree("c", null, null)  // Hojas
%        );        // Contar las hojas
%        int leafCount = BinaryTree.CountLeaves(tree);
%        Console.WriteLine($"Número de hojas en el árbol: {leafCount}"); // Salida: 2
%    }
% }


