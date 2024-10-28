% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción: EL SIGUIENTE PROGRAMA ARMA ARBOLES BINARIOS EQUILIBRADOS
% ===============================================

% PROLOG - PROGRAMA 47
% ===============================================
% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).


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
