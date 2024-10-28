% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: EL SIGUIENTE PROGRAMA COMPRUEBA SI UN TERMINO
% REPRESENTA UN ARBOL BINARIO
% ===============================================

% PROLOG - PROGRAMA 45
% ===============================================
% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).


% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;

% class BinaryTree
% {
%    public object Value { get; set; }
%    public BinaryTree Left { get; set; }
%    public BinaryTree Right { get; set; }

%    // Constructor para el nodo vacío (equivalente a nil en Prolog)
%    public BinaryTree()
%    {
%        Value = null;
%        Left = null;
%        Right = null;
%    }

%    // Constructor para un nodo con un valor y subárboles
%    public BinaryTree(object value, BinaryTree left = null, BinaryTree right = null)
%    {
%        Value = value;
%        Left = left;
%        Right = right;
%    }

%    // Verifica si el árbol es un árbol binario
%    public static bool IsBinaryTree(BinaryTree node)
%    {       // Caso base: nodo vacío
%        if (node == null || node.Value == null)
%            return true;

%        // Verifica recursivamente los subárboles izquierdo y derecho
%        return IsBinaryTree(node.Left) && IsBinaryTree(node.Right);
%    }
% }

% class Program
% {
%    static void Main()
%    {
%        // Ejemplo de un árbol binario válido
%        var tree = new BinaryTree("a",
%            new BinaryTree("b"),
%            new BinaryTree("c", new BinaryTree("d"), new BinaryTree("e"))
%        );

%        Console.WriteLine(BinaryTree.IsBinaryTree(tree)); // true

%        // Ejemplo de un árbol vacío
%        var emptyTree = new BinaryTree();
%        Console.WriteLine(BinaryTree.IsBinaryTree(emptyTree)); // true
%    }
% }
