% ===============================================
% Autor: MARTINEZ NAVA BLANCA YESSENIA
% Fecha: 23 de octubre de 2024
% Descripción:GENERA UN ARBOL DE HUFFMAN DADO UN CONJUNTO DE FRECUENCIAS
% ===============================================

% PROLOG - PROGRAMA 44
% ===============================================
% Construye el árbol de Huffman dado un conjunto de frecuencias.
huffman(Fs, Hs) :- 
    length(Fs, Len), Len > 1, 
    sort(2, @=<, Fs, Sorted), 
    huffman_tree(Sorted, Hs).

% Caso base: cuando solo queda un nodo, este es el árbol de Huffman resultante.
huffman_tree([Node], Node).

% Recursivamente construye el árbol de Huffman uniendo los nodos con menor frecuencia.
huffman_tree([fr(X, FreqX), fr(Y, FreqY) | Rest], Hs) :-
    Freq is FreqX + FreqY,
    Node = fr(tree(X, Y), Freq),
    insert_sorted(Node, Rest, NewList),
    huffman_tree(NewList, Hs).

% Inserta un nuevo nodo en la lista ordenada por frecuencia.
insert_sorted(Node, [], [Node]).
insert_sorted(fr(X, FreqX), [fr(Y, FreqY) | Rest], [fr(X, FreqX), fr(Y, FreqY) | Rest]) :-
    FreqX =< FreqY, !.
insert_sorted(Node, [Head | Rest], [Head | NewRest]) :-
    insert_sorted(Node, Rest, NewRest).

% Asigna códigos de Huffman a cada carácter en el árbol.
generate_codes(hc(X, Code), [(X, Code)]).
generate_codes(fr(tree(L, R), _), Codes) :-
    generate_codes(L, LCodes, '0'),
    generate_codes(R, RCodes, '1'),
    append(LCodes, RCodes, Codes).

generate_codes(hc(X, Code), [(X, NewCode)], Prefix) :-
    atom_concat(Prefix, Code, NewCode).
generate_codes(fr(tree(L, R), _), Codes, Prefix) :-
    atom_concat(Prefix, '0', LPrefix),
    atom_concat(Prefix, '1', RPrefix),
    generate_codes(L, LCodes, LPrefix),
    generate_codes(R, RCodes, RPrefix),
    append(LCodes, RCodes, Codes).



% ===============================================
% PROGRAMA EN C#
% ===============================================
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class HuffmanNode
% {
%    public char? Symbol { get; set; }
%    public int Frequency { get; set; }
%    public HuffmanNode Left { get; set; }
%    public HuffmanNode Right { get; set; }

%    // Constructor para los nodos de la hoja
%    public HuffmanNode(char symbol, int frequency)
%    {
%        Symbol = symbol;
%        Frequency = frequency;
%    }

%    // Constructor para nodos internos
%    public HuffmanNode(HuffmanNode left, HuffmanNode right)
%    {
%        Symbol = null;
%        Frequency = left.Frequency + right.Frequency;
%        Left = left;
%        Right = right;
%    }
% }

% class HuffmanCoding
% {
%    // Genera el árbol de Huffman
%    public static HuffmanNode BuildHuffmanTree(List<(char symbol, int frequency)> frequencies)
%    {
%        var nodes = new List<HuffmanNode>();

%        // Crear nodos hoja
%        foreach (var (symbol, frequency) in frequencies)
%        {
%            nodes.Add(new HuffmanNode(symbol, frequency));
%        }

%        // Construir el árbol
%        while (nodes.Count > 1)
%        {
%            nodes = nodes.OrderBy(n => n.Frequency).ToList();

%            // Tomar los dos nodos de menor frecuencia
%            var left = nodes[0];
%            var right = nodes[1];
%            // Crear nodo interno
%            var parent = new HuffmanNode(left, right);
%            nodes.Remove(left);
%            nodes.Remove(right);
%            nodes.Add(parent);
%        }

%        return nodes[0];
%    }

%    // Genera los códigos de Huffman para cada símbolo
%    public static Dictionary<char, string> GenerateCodes(HuffmanNode root)
%    {
%        var codes = new Dictionary<char, string>();
%        GenerateCodes(root, "", codes);
%        return codes;
%    }

%    private static void GenerateCodes(HuffmanNode node, string code, Dictionary<char, string> codes)
%    {
%        if (node == null) return;

%        // Si es una hoja, asignar el código
%        if (node.Symbol.HasValue)
%        {
%            codes[node.Symbol.Value] = code;
%        }
%        else
%        {
%            // Recursivamente agregar '0' y '1' en el árbol
%            GenerateCodes(node.Left, code + "0", codes);
%            GenerateCodes(node.Right, code + "1", codes);
%        }
%    }

%    public static void Main()
%    {   // Ejemplo de frecuencias de caracteres
%        var frequencies = new List<(char symbol, int frequency)>
%        {
%            ('a', 45), ('b', 13), ('c', 12), ('d', 16), ('e', 9), ('f', 5)
%        };

%        // Construir el árbol de Huffman
%        var huffmanTree = BuildHuffmanTree(frequencies);

%        // Generar códigos de Huffman
%        var codes = GenerateCodes(huffmanTree);

%        Console.WriteLine("Códigos de Huffman:");
%        foreach (var (symbol, code) in codes)
%        {
%            Console.WriteLine($"{symbol}: {code}");
%        }
%    }
% }




