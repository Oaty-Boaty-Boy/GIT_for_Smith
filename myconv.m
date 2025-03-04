

function y = myconv(sig,IR)
N = length(sig);
m =length(IR);
y= zeros (1,N+m-1);

for i = 1:m
    for ii = 1:N
  y (i+ii-1) = y (i+ii-1)+ sig (i).*IR(ii);
    end 
end 
end 
