function Friction = frict(Re)
% setting up piecewise
    if Re <= 2100
        Friction = 16 / Re;
    elseif Re <= 1e5
        Friction = 0.0791 * Re^(-0.25);
    else
        Friction = 0.004;
    end
end