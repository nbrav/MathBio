N=50;
Da=1;
Db=3;
ra=0.1;
rb=0.1;
c1=1;
c3=1;
c2=-1;
c4=-1;

ua=zeros(N,1)+0.1*rand(N,1); 
ub=zeros(N,1)+0.1*rand(N,1); 
% ua=zeros(N,1); 
% ua(20)=0.14;
% ub=zeros(N,1);
ff = [];
ff_a=[];
ff_b=[];
for t=0:300
uad1=[ua(2:N)' ua(1)]';
uad2=[ua(N) ua(1:(N-1))']'; 
deltau_a=c1*ua + c2*ub - ra*ua.^3 + Da*(uad1+uad2-2*ua);

ubd1=[ub(2:N)' ub(1)]';
ubd2=[ub(N) ub(1:(N-1))']'; 
deltau_b=c3*ua + c4*ub - ra*ub.^3 + Db*(ubd1+ubd2-2*ub);

ua=ua+deltau_a*0.1;
ub=ub+deltau_b*0.1;
ff = [ff ; [ua ;ub]'];
% ff_a=[ff_a; ua'];
% ff_b=[ff_b; ub'];
end
imagesc(ff);
% imagesc(ff_a);
% imagesc(ff_b);
drawnow