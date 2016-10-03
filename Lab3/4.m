
# da 
# --  = c1.a + c2.b − ra.a3 + Da ∇2a
# dt

# db
# --  = c3.a + c4.b − rb.b3 + Db ∇2b
# dt

M = 50;
N = 50;
c1 = 1;
c2 = -1;
c3 = 1;
c4 = -1;
ra = 0.1;
rb = 0.1;
Da = 1;
Db = -1;

#Q7
#a = zeros(M,N) + 0.1*rand(M,N); 
#b = zeros(M,N) + 0.1*rand(M,N);

#Q8
#a = zeros(M,N) + 0.1*rand(M,N); 
#b = zeros(M,N) + 0.1*rand(M,N);

#Q9
a = zeros(M,N); a(10,15) = 0.1; a(15,10) = 0.1;
b = zeros(M,N);


ff = [];

for t = 0:1000
    ad1 = [a(2:M,:); a(1,:)];
    ad2 = [a(M,:); a(1:(M-1),:)];
    ad3 = [a(:,2:N), a(:,1)];
    ad4 = [a(:,N), a(:,1:(N-1))];

    bd1 = [b(2:M,:); b(1,:)];
    bd2 = [b(M,:); b(1:(M-1),:)];
    bd3 = [b(:,2:N), b(:,1)];
    bd4 = [b(:,N), b(:,1:(N-1))];

    da = c1*a + c2*b - ra*a.^3 + Da*(ad1+ad2+ad3+ad4-4*a);
    db = c3*a + c4*b - rb*b.^3 + Db*(bd1+bd2+bd3+bd4-4*b);

    a = a + da*0.1;
    b = b + db*0.1;

    #ff = cat(3,ff,[a,b]);
    subplot(1,2,1);
    imagesc(a);
    subplot(1,2,2);
    imagesc(b);

    drawnow
end

#elimating the time axes
