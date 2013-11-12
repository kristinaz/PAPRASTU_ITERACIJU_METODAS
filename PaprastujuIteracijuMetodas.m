function saknis = PaprastujuIteracijuMetodas(funkcija_7,funkcija_7_fi_1,funkcija_7_fi_2,a,b,dx,tol)
% Paprastuju iteraciju metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%   @funkcija_7 - pradine f-ja.
%   @funkcija_7_fi_1 - pirma isvestine
%   @funkcija_7_fi_2 - antra isvestine
%   a- pradinis intervalo skaicius, b-galutinis intervalo skaicius.
%   E-epsilonas maksimalus nuokrypis nuo galutinio rez (nebutina ivest)
%   xa- skaicius intervale [x1;x2] (nebutina ivest)
%   filter - singuliarumo filtras: 0 = isjungta (pagal nutylejima), 1 = ijungta.
%   tol - paklaida (pagal nutylejima 0.0001).
%   dx - zingsnio ilgis kreipiantis i sklaidos metoda (b-a)/n
% PALEIDIMAS:
% saknis = PaprastujuIteracijuMetodas(funkcija_7,funkcija_7_fi_1,funkcija_7_fi_2,a,b,dx,tol)

 
if nargin<7 
    tol=0.01;             
end
if nargin<6 
    dx=1;
end
a_pradinis=a; % Reikalingas tik spausdinimui apacioje
saknusk = 0;
while 1
 [x1,x2] = skaidosmetodas(funkcija_7,a,b,1)
 if isnan(x1) 
    disp('Sprendiniu daugiau nera.');
    break
 else
   a = x2;
   xa =x1+(x2-x1)*rand(1)
   saknis = paprastujuImetodas(funkcija_7,funkcija_7_fi_1,funkcija_7_fi_2,x1,x2,tol,xa)
    if ~isnan(saknis)
         saknusk = saknusk + 1;
                     if saknis < b
                      saknis(saknusk) = saknis;
                     end
end
end
end
x=a_pradinis:0.1:b;
y = funkcija_7(x);
plot(x,y)
hold on;
x_saknys = saknis;
y_saknys = funkcija_7(x_saknys);
scatter(x_saknys, y_saknys,'*r');

