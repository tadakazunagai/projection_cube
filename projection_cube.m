% 2019.6.29 Tadakazu Nagai

clear all; close all;

%% Cube data
A = [0 0 0]';
B = [0 10 0]';
C = [0 10 10]';
D = [0 0 10]';
E = [10 0 0]';
F = [10 10 0]';
G = [10 10 10]';
H = [10 0 10]';

%% Transform
R = [1 0 0;
     0 1/sqrt(2) 1/sqrt(2);
     0 -(1/sqrt(2)) 1/sqrt(2)];
t = [0 0 50]';

A = R*A + t;
B = R*B + t;
C = R*C + t;
D = R*D + t;
E = R*E + t;
F = R*F + t;
G = R*G + t;
H = R*H + t;

%% Homography
function x = projection_x(f, X, Z)
  x = f*(X/Z);
endfunction

function y = projection_y(f, Y, Z)
  y = f*(Y/Z);
endfunction

a = [projection_x(1, A(1), A(3)); projection_y(1, A(2), A(3))];
b = [projection_x(1, B(1), B(3)); projection_y(1, B(2), B(3))];
c = [projection_x(1, C(1), C(3)); projection_y(1, C(2), C(3))];
d = [projection_x(1, D(1), D(3)); projection_y(1, D(2), D(3))];
e = [projection_x(1, E(1), E(3)); projection_y(1, E(2), E(3))];
f = [projection_x(1, F(1), F(3)); projection_y(1, F(2), F(3))];
g = [projection_x(1, G(1), G(3)); projection_y(1, G(2), G(3))];
h = [projection_x(1, H(1), H(3)); projection_y(1, H(2), H(3))];

%% show cube
function draw_line(a, b)
  ridgeline_x = [a(2), b(2)]; % swap axis
  ridgeline_y = [a(1), b(1)]; % swap axis
  plot(ridgeline_x, ridgeline_y)
endfunction

function draw_hidden_line(a, b)
  ridgeline_x = [a(2), b(2)]; % swap axis
  ridgeline_y = [a(1), b(1)]; % swap axis
  plot(ridgeline_x, ridgeline_y, '--')
endfunction

draw_hidden_line(g, h)
hold on
draw_hidden_line(h, e)
draw_hidden_line(h, d)

draw_line(a, b)
draw_line(b, f)
draw_line(f, e)
draw_line(e, a)

draw_line(b, c)
draw_line(c, g)
draw_line(g, f)

draw_line(f, g)

% print('capture.png')
