%% Consider the following configuration of 64 triangles:
%%                  /\
%%                 /\/\
%%                .......

%% We wish to colour the interior of each triangle with one of
%% three colours: red, green or blue, so that no two
%% neighbouring triangles have the same colour. Such a colouring
%% shall be called valid. Here, two triangles are said to be
%% neighbouring if they share an edge.
%% Note: if they only share a vertex, then they are not neighbours.

%% For example, here is a valid colouring of the above grid:

%% A colouring C' which is obtained from a colouring C by rotation
%% or reflection is considered distinct from C unless the two are identical.

%% How many distinct valid colourings are there for the above configuration?

%% Much help from:
%%  http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_9.html

member(X,[X|R]).
member(X,[Y|R]) :- member(X,R).

%% edge relation is symmetric
adjacent(X,Y,Map) :-  member([X,Y],Map) ; member([Y,X],Map).

find_regions([],R,R).
find_regions([[X,Y]|S], R,A) :- 
      (member(X,R) ->  
        (member(Y,R) -> find_regions(S,R,A) ;
        find_regions(S,[Y|R],A)) ; 
      (member(Y,R) -> find_regions(S,[X|R],A) ;
        find_regions(S,[X,Y|R],A))).


color(Map,Colors,Coloring) :-
        find_regions(Map,[],Regions), 
        color_all(Regions,Colors,Coloring), 
        \+ conflict(Map,Coloring).

color_all([R|Rs],Colors,[[R,C]|A]) :- 
        member(C,Colors), 
        color_all(Rs,Colors,A). 
color_all([],_,[]). 
 
 
conflict(Map,Coloring) :- 
        member([R1,C],Coloring), 
        member([R2,C],Coloring), 
        adjacent(R1,R2,Map).

color([[1,3],[2,3],[3,4]],
      [red,green,blue],
      Coloring).

triangle_map(Map) :- Map=
  [
  [1 , 3],
  [2 , 3], [3,4],
  [2 , 6],     [4,8],
  [5 , 6], [6,7] , [7,8] , [8,9],
  [5 ,11],     [7,13],         [9,15],
  [10,11],[11,12],[12,13],[13,14],[14,15],[15,16],
  [10,18],    [12,20],        [14,22],        [16,24],
  [17,18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],
  [17,27],    [19,29],        [21,31],        [23,33],        [25,35],
  [26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33],[33,34],[34,35],[35,36],
  [26,38],    [28,40],        [30,42],        [32,44],        [34,46],        [36,48],
  [37,38],[38,39],[39,40],[40,41],[41,42],[42,43],[43,44],[44,45],[45,46],[46,47],[47,48],[48,49],
  [37,51],    [39,53],        [41,55],        [43,57],        [45,59],        [47,61],        [49,63],
  [50,51],[51,52],[52,53],[53,54],[54,55],[55,56],[56,57],[57,58],[58,59],[59,60],[60,61],[61,62],[62,63],[63,64]
  ].  
