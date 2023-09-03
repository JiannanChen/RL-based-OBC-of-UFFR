function [sys,x0,str,ts,simStateCompliance] = uffr_ob(t,x,u,flag)

%
% The following outlines the general structure of an S-function.
%
switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,
    sys=[];

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%%%%%
  % GetTimeOfNextVarHit %
  %%%%%%%%%%%%%%%%%%%%%%%
  case 4,
    sys=[];

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,
    sys=[];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end

% end sfuntmpl

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes

%
% call simsizes for a sizes structure, fill it in and convert it to a
% sizes array.
%
% Note that in this example, the values are hard coded.  This is not a
% recommended practice as the characteristics of the block are typically
% defined by the S-function parameters.
%
sizes = simsizes;

sizes.NumContStates  = 245;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 15;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

%
% initialize the initial conditions
%
% x0 = [2, 0.1, 0,
%     0.1,
%     0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,
%     0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,
%     
%     0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,
%     0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,
%     
%     0.1,
%     0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,
%     0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1
% ];

% x0 = [2, 0.1, 0,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];

x0 = [2, 0.1, 0,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.1,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6];

% x0 = [2, 0.1, 0,0.1,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];

%
% str is always an empty matrix
%
str = [];

%
% initialize the array of sample times
%
ts  = [0 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'DisallowSimState' < Error out when saving or restoring the model sim state
simStateCompliance = 'UnknownSimState';

% end mdlInitializeSizes

%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u)
% 系统参数-无人消防机器人
m = 200;
c = 0.05;
r = 0.1;
Jw = 0.005;
Jv = 10;
k = 6;
Fp = 50;
s = 1;
beta = 0.1*sin(t)*180/pi;
l = 0.3;

a1 = 2*c/(m*r^2 + 2*Jw);
b1 = k*r/(m*r^2 + 2*Jw);
c1 = r*r/(m*r^2 + 2*Jw);
a2 = 2*c*l*l/(Jv*r^2 + 2*Jw*l^2);
b2 = r*l*k/(Jv*r^2 + 2*Jw*l^2);
c2 = r*r/(Jv*r^2 + 2*Jw*l^2);

g1 = 0.9;
g2 = 0.95;
B1 = b1*g1;
B2 = b2*g2;
Fdv = -Fp*cos(beta);
Fdp = -s*Fp*cos(beta)*sin(beta);

% 跟踪目标
x_1d=2*sin(t);
x_2d=0.2*sin(t);

% 控制参数
global nd_j1
global nd_j2
global nd_j3
nd_j1=40;
nd_j2=40;
nd_j3=40;

% mu=2;
% k1=3;->7;11;13;15;20;30;50;100;
% r_phi1=1;
% r_c1=4;
% r_a1=6;
% k2=3;->7;11;13;15;20;30;50;100;
% r_c2=4;
% r_a2=6;
% k3=3;->7;11;13;15;20;30;50;100;
% r_phi2=1;
% r_c3=4;
% r_a3=6;
gamma=1;
scal=2;
mu=3;
k1=100;
r_phi1=1;
r_c1=4*scal;
r_a1=6*scal;
k2=100;
r_c2=4*scal;
r_a2=6*scal;
k3=100;
r_phi2=1;
r_c3=4*scal;
r_a3=6*scal;

% X1-子系统
z1=x(1)-x_1d;

S_j1=zeros(nd_j1,1);
for i = 1:1:nd_j1
    S_j1(i)=exp(-norm([x(1),z1]'-[10,10]'+(1/2)*[i,i]')^2/mu^2);
end 
S_j1_2=S_j1*S_j1';
W_c1=x(4+1:4+nd_j1);
W_a1=x(4+nd_j1+1:4+nd_j1*2);

Uv=-k1*z1+x(4)*x(1)-0.5*W_a1'*S_j1;

% X2-子系统
z2=x(2)-x_2d;

S_j2=zeros(nd_j2,1);
for i=1:1:nd_j2
    S_j2(i)=exp(-(z2-10+(1/2)*i)^2/mu^2);
end
S_j2_2=S_j2*S_j2';
W_c2=x(4+nd_j1*2+1:4+nd_j1*2+nd_j2);
W_a2=x(4+nd_j1*2+nd_j2+1:4+nd_j1*2+nd_j2*2);

alpha_2=-k2*z2-0.5*(W_a2'*S_j2);

% X3-子系统
z3=x(3)-alpha_2;

S_j3=zeros(nd_j3,1);
for i=1:1:nd_j3
    S_j3(i)=exp(-norm([x(3),z3]'-[10,10]'+(1/2)*[i,i]')^2/mu^2);
end
S_j3_2=S_j3*S_j3';
W_c3=x(5+nd_j1*2+nd_j2*2+1:5+nd_j1*2+nd_j2*2+nd_j3);
W_a3=x(5+nd_j1*2+nd_j2*2+nd_j3+1:5+nd_j1*2+nd_j2*2+nd_j3*2);

Up=-k3*z3+x(4+nd_j1*2+nd_j2*2+1)*x(3)-0.5*(W_a3'*S_j3);

% 系统模型-无人消防机器人
sys(1) = -a1*x(1) + B1*Uv - c1*Fdv;
sys(2) = x(3);
sys(3) = -a2*x(3) + B2*Up - c2*Fdp;

% X1-子系统
sys(4) = -x(1)*z1-r_phi1*x(4); % phi1

for i=1:1:nd_j1
    sys(4+i) = -r_c1*S_j1_2(i,:)*W_c1; % W_c1
end

for i=1:1:nd_j1
    sys(4+nd_j1+i) = -S_j1_2(i,:)*(r_a1*(W_a1-W_c1)+r_c1*W_c1); % W_a1
end

% X2-子系统
for i=1:1:nd_j2
    sys(4+nd_j1*2+i) = -r_c2*S_j2_2(i,:)*W_c2; % W_c2
end

for i=1:1:nd_j2
    sys(4+nd_j1*2+nd_j2+i) = -S_j2_2(i,:)*(r_a2*(W_a2-W_c2)+r_c2*W_c2); % W_a2
end

% X3-子系统
sys(4+nd_j1*2+nd_j2*2+1) = -x(2)*z3-r_phi2*x(4+nd_j1*2+nd_j2*2+1); % phi2

for i=1:1:nd_j3
    sys(5+nd_j1*2+nd_j2*2+i) = -r_c3*S_j3_2(i,:)*W_c3; % W_c3
end

for i=1:1:nd_j3
    sys(5+nd_j1*2+nd_j2*2+nd_j3+i) = -S_j3_2(i,:)*(r_a3*(W_a3-W_c3)+r_c3*W_c3); % W_a3
end


% end mdlDerivatives

%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)
% 系统参数-无人消防机器人
m = 200;
c = 0.05;
r = 0.1;
Jw = 0.005;
Jv = 10;
k = 6;
Fp = 50;
s = 1;
beta = 0.1*sin(t)*180/pi;
l = 0.3;

a1 = 2*c/(m*r^2 + 2*Jw);
b1 = k*r/(m*r^2 + 2*Jw);
c1 = r*r/(m*r^2 + 2*Jw);
a2 = 2*c*l*l/(Jv*r^2 + 2*Jw*l^2);
b2 = r*l*k/(Jv*r^2 + 2*Jw*l^2);
c2 = r*r/(Jv*r^2 + 2*Jw*l^2);

g1 = 0.9;
g2 = 0.95;
B1 = b1*g1;
B2 = b2*g2;
Fdv = -Fp*cos(beta);
Fdp = -s*Fp*cos(beta)*sin(beta);

% 跟踪目标
x_1d=2*sin(t);
x_2d=0.2*sin(t);

% 控制参数
global nd_j1
global nd_j2
global nd_j3
nd_j1=40;
nd_j2=40;
nd_j3=40;

% mu=2;
% k1=3;->7;11;13;15;20;30;50;100;
% r_phi1=1;
% r_c1=4;
% r_a1=6;
% k2=3;->7;11;13;15;20;30;50;100;
% r_c2=4;
% r_a2=6;
% k3=3;->7;11;13;15;20;30;50;100;
% r_phi2=1;
% r_c3=4;
% r_a3=6;
gamma=1;
scal=2;
mu=3;
k1=100;
r_phi1=1;
r_c1=4*scal;
r_a1=6*scal;
k2=100;
r_c2=4*scal;
r_a2=6*scal;
k3=100;
r_phi2=1;
r_c3=4*scal;
r_a3=6*scal;

% X1-子系统
z1=x(1)-x_1d;

S_j1=zeros(nd_j1,1);
for i = 1:1:nd_j1
    S_j1(i)=exp(-norm([x(1),z1]'-[10,10]'+(1/2)*[i,i]')^2/mu^2);
end 
S_j1_2=S_j1*S_j1';
W_c1=x(4+1:4+nd_j1);
W_a1=x(4+nd_j1+1:4+nd_j1*2);

Uv=-k1*z1+x(4)*x(1)-0.5*W_a1'*S_j1;

% X2-子系统
z2=x(2)-x_2d;

S_j2=zeros(nd_j2,1);
for i=1:1:nd_j2
    S_j2(i)=exp(-(z2-10+(1/2)*i)^2/mu^2);
end
S_j2_2=S_j2*S_j2';
W_c2=x(4+nd_j1*2+1:4+nd_j1*2+nd_j2);
W_a2=x(4+nd_j1*2+nd_j2+1:4+nd_j1*2+nd_j2*2);

alpha_2=-k2*z2-0.5*(W_a2'*S_j2);

% X3-子系统
z3=x(3)-alpha_2;

S_j3=zeros(nd_j3,1);
for i=1:1:nd_j3
    S_j3(i)=exp(-norm([x(3),z3]'-[10,10]'+(1/2)*[i,i]')^2/mu^2);
end
S_j3_2=S_j3*S_j3';
W_c3=x(5+nd_j1*2+nd_j2*2+1:5+nd_j1*2+nd_j2*2+nd_j3);
W_a3=x(5+nd_j1*2+nd_j2*2+nd_j3+1:5+nd_j1*2+nd_j2*2+nd_j3*2);

Up=-k3*z3+x(4+nd_j1*2+nd_j2*2+1)*x(3)-0.5*(W_a3'*S_j3);

% 代价函数计算
J1=W_c1'*S_j1+2*k1*z1-2*x(4)*x(1);
J2=W_c2'*S_j2+2*k2*z2;
J3=W_c3'*S_j3+2*k3*z3-2*x(4+nd_j1*2+nd_j2*2+1)*x(2);

% 输出状态
sys(1) = x(1);
sys(2) = x(2);

% 输出误差
sys(3) = z1;
sys(4) = z2;

% 权值
sys(5) = norm(W_c1);
sys(6) = norm(W_a1);

% 权值
sys(7) = norm(W_c2);
sys(8) = norm(W_a2);

% 权值
sys(9) = norm(W_c3);
sys(10) = norm(W_a3);

% 权值
sys(11) = norm(J1);
sys(12) = norm(J2);
sys(13) = norm(J3);

% 期望信号
sys(14) = x_1d;
sys(15) = x_2d;



% end mdlOutputs
