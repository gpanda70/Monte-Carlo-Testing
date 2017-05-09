function [  ] = MarkovChain( delta, lambda1, lambda2, iter, maxD )
%MARKOVCHAIN prints a graph representing a markov chain where lambda1 and
%lambda2 are the lambda values of the Markov Generation matrix 
%[-λ1,λ1; λ2,-λ2], the larger the |λ1| value is the more it hits 2 the
%larger |λ2| the more it hits 1

%iter is number of times you want graph to be printed
%dist is how far you want the graph to go
%delta is the step size

%for testing purposes
%use delta as .01, iter as 1, dist as 5, λ1 as 6 and λ2 as 10
%so run MarkovChain(.01,6,10,1,5)


alpha=zeros(1,maxD/delta); %creates a vector of alpha

%loop to print iter # of paths
for j=1:iter
    
    alpha(1)=randi([1,2]); %randomly choose alpha 1 as random integer from 1 to 2
    
    %this loop checks what previous alpha value is then gives a value to
    %the current one based on the previous values
    for i = 1:maxD/delta
     u=rand(); %uniform random variable
        if alpha(i)==1
            if u<=1-(delta*lambda1)
              alpha(i+1)=1;
            else
                alpha(i+1)=2;
            end
        else
         if u<=1-(delta*lambda2)
            alpha(i+1)=2;
         else
            alpha(i+1)=1;
         end
        end

    end
    x=0:delta:maxD;

%graph 
figure
stairs(x,alpha,'r')

axis([0 maxD   0.5 2.5])
end
