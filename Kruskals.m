function [ T ] = Kruskals( G, C )
%Input: Node-Node Adjacency Matric, cost matrix C where if G(i,j) = 0, then
%C(i,j) = inf. 
%Output: T is a node-node adjacency matrix representing the
%MST.

n = size(G,2);                              %n = number of nodes
c = [];                                     %Cost of all the arcs in the network
ii = [];                                    %Entry k is going to give the 'i' of the k-th arc in c.
jj = [];                                    %Entry k is going to give the 'j' of the k-th arc in c.

for i = 1:n                                 % Create the cost array containing costs of all arcs
    for j = i + 1:n
        if G(i,j) == 1                      %C(i,j) < Inf
            c = [c C(i,j)];
            ii = [ii i];
            jj = [jj j];
        end
    end
end

[b index] = sort(c);                        %Sorted cost array
L = 1;
k = 0;
T = zeros(n,n);
costT = 0;

while k < n - 1
    i = ii(index(L));
    j = jj(index(L));
    pred = SearchNodeNode(T,i);
    if pred(j) > 0
        L = L + 1;
    else
        T(i,j) = 1;
        T(j,i) = 1;
        k = k + 1;
        L = L + 1;
        costT = costT + b(L);               %b(L) = c(index(L))
    end
end