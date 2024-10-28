% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: EL SIGUIENTE PROGRAMA CONSTRUYE UN ARBOL BINARIO 
% APARTIR DE UNA LISTA DE ENTEROS
% ===============================================

% PROLOG - PROGRAMA 48
% ===============================================
% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo, todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).


% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;

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

%    // Verifica si el árbol es simétrico
%    public static bool IsSymmetric(BinaryTree root)
%    {
%        // Si el árbol está vacío, es simétrico
%        if (root == null)
%            return true;

%        // Verifica si los subárboles izquierdo y derecho son espejos
%        return IsMirror(root.Left, root.Right);
%    }

%    // Verifica si dos árboles son espejos entre sí
%    private static bool IsMirror(BinaryTree tree1, BinaryTree tree2)
%    {
%        // Ambos subárboles están vacíos, son espejos
%        if (tree1 == null && tree2 == null)
%            return true;

%        // Uno está vacío y el otro no, no son espejos
%        if (tree1 == null || tree2 == null)
%            return false;

%        // Ambos subárboles tienen el mismo valor y sus subárboles opuestos son espejos
%        return (tree1.Value.Equals(tree2.Value)) &&
%               IsMirror(tree1.Left, tree2.Right) &&
%               IsMirror(tree1.Right, tree2.Left);
%    }
% }

% class Program
% {
%    static void Main()
%    {        // Ejemplo de un árbol simétrico
%        var symmetricTree = new BinaryTree("a",
%            new BinaryTree("b", new BinaryTree("c"), new BinaryTree("d")),
%            new BinaryTree("b", new BinaryTree("d"), new BinaryTree("c"))
%        );

%        // Ejemplo de un árbol no simétrico
%        var nonSymmetricTree = new BinaryTree("a",
%            new BinaryTree("b", new BinaryTree("c"), null),
%            new BinaryTree("b", null, new BinaryTree("c"))
%        );

%        Console.WriteLine(BinaryTree.IsSymmetric(symmetricTree)); // true
%        Console.WriteLine(BinaryTree.IsSymmetric(nonSymmetricTree)); // false
%    }
% }





