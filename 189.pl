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
    [ [ca,az],[ca,nv],[ca,or],[or,wa],[wa,id],[or,id],
      [nv,id],[nv,az],[az,ut],[nv,ut],[ut,id],[ut,wy],
      [ut,co],[id,mt],[mt,wy],[id,wy],[wy,co],[az,co],
      [ut,nm],[nm,az],[nm,co],[mt,nd],[mt,sd],[nd,sd], 
      [wy,sd],[wy,nb],[nb,co],[nb,sd],[nb,ks],[co,ks],
      [co,ok],[ks,ok],[tx,ok],[nm,ok],[nm,tx],[nd,mn], 
      [sd,mn],[sd,ia],[mn,ia],[nb,ia],[nb,mo],[mo,ia],
      [mo,ks],[mo,ok],[mo,ar],[ok,ar],[ar,tx],[ar,la],
      [tx,la],[mn,wi],[ia,wi],[wi,il],[ia,il],[mo,il],
      [il,ky],[mo,ky],[ar,tn],[tn,ky],[ar,ms],[ms,la],
      [ms,tn],[mi,wi],[in,il],[in,mi],[in,ky],[tn,al],
      [al,ms],[mi,oh],[oh,in],[oh,ky],[ky,va],[ky,wv],
      [oh,wv],[tn,va],[tn,ga],[tn,nc],[ga,al],[ga,nc],
      [oh,pa],[al,fl],[ga,fl],[ga,sc],[nc,sc],[va,nc],
      [wv,va],[md,de],[md,wv],[md,va],[md,pa],[wv,pa],
      [de,pa],[de,nj],[pa,ny],[pa,nj],[ny,nj],[ny,ct],
      [ny,ma],[ma,ct],[ma,ri],[ct,ri],[ny,vt],[vt,nh],
      [ma,vt],[ma,nh],[me,nh],[nv,or] ].  
