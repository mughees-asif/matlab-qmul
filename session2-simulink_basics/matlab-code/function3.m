function p = function3(a, b, c)

    d = sqrt(b^2 - 4*a*c); % discriminant
        if d<0
            disp('Warning: discriminant is negative, roots are imaginary');
        elseif d==0
            disp('The discriminant is zero, roots are repeated');
        else
            disp('OK: roots are real and distinct');
        end
    p =  (-b + [ -1  +1 ]*d) / (2*a);
    
end