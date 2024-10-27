% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula la función totiente de Euler.
totient(1, 1).
totient(M, Phi) :- 
    M > 1,
    totient_acc(M, M - 1, 0, Phi).

% Caso base: si K es 0, devuelve el acumulador.
totient_acc(_, 0, Acc, Acc).

% Incrementa el acumulador si K y M son coprimos.
totient_acc(M, K, Acc, Phi) :- 
    K > 0,
    coprime(M, K),
    Acc1 is Acc + 1,
    K1 is K - 1,
    totient_acc(M, K1, Acc1, Phi).

% No incrementa el acumulador si K y M no son coprimos.
totient_acc(M, K, Acc, Phi) :- 
    K > 0,
    \+ coprime(M, K),
    K1 is K - 1,
    totient_acc(M, K1, Acc, Phi).
