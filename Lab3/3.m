
# da 
# --  = c1.a + c2.b − ra.a3 + Da ∇2a
# dt

# db
# --  = c3.a + c4.b − rb.b3 + Db ∇2b
# dt

#Default
N = 50;
c1 = 1;
c2 = -1;
c3 = 1;
c4 = -1;
ra = 0.1;
rb = 0.1;
Da = 1;
Db = 3;

stabilty = [];

for c1_i = 1:10
    for c2_i = 1:10
      a = zeros(N,1); a(25) = 0.14;
      b = zeros(N,1);
      c1 = -5 + c1_i;
      c2 = -5 + c2_i;

      ff = [];
      
      for t = 0:1000
	ad1 = [a(2:N)' a(1)]';
	ad2 = [a(N) a(1:(N-1))']';
	bd1 = [b(2:N)' b(1)]';
	bd2 = [b(N) b(1:(N-1))']';
	
	da = c1*a + c2*b - ra*a.^3 + Da*(ad1+ad2-2*a);
	db = c3*a + c4*b - rb*b.^3 + Db*(bd1+bd2-2*b);

	a = a + da*0.1;
	b = b + db*0.1;
	
	ff = [ff; [a;b]'];
    
        #imagesc(ff);
        #drawnow
      end

      #phase finder
      if ((abs(mean(ff(end,1:N)))>2) || (abs(mean(ff(end,N:N*2)))>2)) #unstable
	phase = 2;
      elseif sum(ff(end,:) - ff(end-1,:)) > 0.1 #limit cycle
	phase = 1;
      else #converge
	phase = 0;
      end

      stabilty(c1_i,c2_i) =  phase;      
    end
end
