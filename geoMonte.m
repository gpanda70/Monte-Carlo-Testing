function [avg] = geoMonte( delta, mu, sigma, S0, iter, maxD, plotNum )
%this is Monte Carlo model with geometric Brownian motion
%delta is step size, mu is the mean, sigma is the volatility
%S0 is initial stock price > 0
%iter is number of iterations that will happen
%maxD is max distance of x-axis 
%plotNum is the number of times you want to plot
%avg is the average of the endpoints
%to test use geoMonte(.01, .20, .30, 1.5, 1000, 5, 5)

totalN = maxD/delta+1;
X = zeros(1,totalN);
X(1)=S0;
endPoint = zeros(1,iter);

%generates 1000 paths
for j=1:iter
   
    for i=2:totalN
        X(i) = X(i-1) + X(i-1)*(delta*mu + sigma*sqrt(delta)*randn);
        
    end
    endPoint(j) = X(totalN);
x=0:delta:maxD;

title('Monte Carlo Simulation')
xlabel('time') % x-axis label
ylabel('Bt')

%plot paths
if(j<=plotNum)
    plot(x,X);
    hold on;
end

end


avg = mean(endPoint);

end
