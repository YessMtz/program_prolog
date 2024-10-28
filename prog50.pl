% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: 
% ===============================================

%PROLOG - PROGRAMA 50
% ===============================================
internals(nil, []).
internals(t(X, L, R), [X|Internals]) :- 
    (L \= nil ; R \= nil), 
    internals(L, IL), 
    internals(R, IR), 
    append(IL, IR, Internals).
internals(t(_, nil, nil), []).


% ===============================================
% PROGRAMA EN C#
% ===============================================

% using System;
% using System.Collections.Generic;

% class BinaryTree
% {
%    public object Value { get; set; }
%    public BinaryTree Left { get; set; }
%    public BinaryTree Right { get; set; }

%    // Constructor para un nodo del árbol
%    public BinaryTree(object value, BinaryTree left = null, BinaryTree right = null)
%    {
%        Value = value;
%        Left = left;
%        Right = right;
%    }

%    // Colecta todos los nodos internos en una lista
%    public static List<object> GetInternals(BinaryTree node)
%    {
%        List<object> internals = new List<object>();

%        // Caso base: árbol vacío
%        if (node == null)
%            return internals;

%        // Si el nodo tiene al menos un subárbol, es un nodo interno
%        if (node.Left != null || node.Right != null)
%        {
%            internals.Add(node.Value);
%        }        // Recursivamente colecta los nodos internos de los subárboles izquierdo y derecho
%        internals.AddRange(GetInternals(node.Left));
%        internals.AddRange(GetInternals(node.Right));

%        return internals;
%    }
% }

% class Program
% {
%    static void Main()
%    {        // Ejemplo de un árbol binario
%        var tree = new BinaryTree("a",
%            new BinaryTree("b"),
%            new BinaryTree("c",
%                new BinaryTree("d")
%            )
%        );

%        // Obtener nodos internos
%        var internalNodes = BinaryTree.GetInternals(tree);

%        // Mostrar los nodos internos
%        Console.WriteLine("Nodos internos: " + string.Join(", ", internalNodes)); // Salida: Nodos internos: a, c
%    }
% }
