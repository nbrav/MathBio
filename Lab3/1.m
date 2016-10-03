N=50;
Du=1;
k=2.3;
u=zeros(N,1)+.01*rand(N,1);
ff=[];

for t=0:3000
  ud1=[u(2:N)' u(1)]';
  ud2=[u(N) u(1:(N-1))']';
  deltau=k*sin(u) + Du*(ud1+ud2-2*u);
  u=u+deltau*.1;
  ff=[ff; u'];
  imagesc(ff);
  drawnow
end
