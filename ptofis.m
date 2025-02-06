function [succ,it] = ptofis(x0, phi, nmax, toll, a, b, f)
		% PTOFIS  Fixed-Point Iteration Method with Plot
		%   This function implements the fixed-point iteration method to solve the equation
		%   x = phi(x), where phi is a transformation function. The iterations are also
		%   displayed in a plot, allowing the progress towards the solution to be observed.
		%
		%   Syntax:
		%   [succ, it] = ptofis(x0, phi, nmax, toll, a, b, f)
		%
		%   Input:
		%   - x0     : Initial guess for the iteration (initial value of x).
		%   - phi    : Transformation function phi(x) to use in the method.
		%   - nmax   : Maximum number of iterations.
		%   - toll   : Tolerance for the stopping criterion (error between iterations).
		%   - a      : Lower bound of the interval [a, b] for the plot (optional).
		%   - b      : Upper bound of the interval [a, b] for the plot (optional).
		%   - f      : Function to compare with phi(x) (optional, if provided, it will be plotted).
		%
		%   Output:
		%   - succ   : Vector containing the values of the iteration sequence.
		%   - it     : Number of iterations performed.
		%
		%   Description:
		%   The function implements the fixed-point iteration method, using the provided
		%   transformation function phi. At each iteration, the current value of x is updated
		%   as phi(x). The process continues until the error between two consecutive iterations
		%   is smaller than the specified tolerance or until the maximum number of iterations
		%   is reached.
		%
		%   If the parameters a, b, and f are provided, the function will display a plot that
		%   includes:
		%   - The curve of phi(x) in blue.
		%   - The line x = y in red.
		%   - The iterations of the method in green.
		%   - The function f(x) in yellow (if provided).
		%
		%   Example:
		%   % Define the phi function and an initial value
		%   phi = @(x) cos(x);
		%   x0 = 0.5;
		%   nmax = 100;
		%   toll = 1e-6;
		%   a = -2;
		%   b = 2;
		%   % Run the fixed-point iteration method
		%   [succ, it] = ptofis(x0, phi, nmax, toll, a, b);
		%   % The variable succ contains the sequence of iterations
		%   % The variable it contains the number of iterations
		%
		%   Notes:
		%   - If the maximum number of iterations is reached without convergence,
		%     the function will print a warning message.
		%   - The function includes checks to display plots only if the parameters
		%     for visualization (a, b, and f) are provided.
        %
		%   Credits:
		%   Alessandro Tobia Cavalieri, Politecnico di Milano
        
    % Initialization
    it = 0;
    x = x0;
    err = toll +1;
    succ = [];

    if(nargin>4) % Plotting is needed
        % Plotting
        figure;
        xx = linspace(a,b,100);
        p0 = plot(xx,phi(xx), 'Color','b');                                         %phi
        hold on;
        p1 = plot(xx,xx, 'Color', 'r');                                             % x = y
        p2 = plot(xx, 0*xx, 'Color','k');                                           % x axis
        p3 = plot([x x], [0 phi(x)], '-', 'MarkerSize', 10, 'Color', [0 0.5 0]);    % first iteration
    
        % Set legend visibility and names
        p2.Annotation.LegendInformation.IconDisplayStyle = 'off';
        p3.Annotation.LegendInformation.IconDisplayStyle = 'off';
        set(p0, 'DisplayName', '\phi(x)');
        set(p1, 'DisplayName', 'x=y');
        
        hgit = hggroup; % group of iterations
    
        % Add original function plot if arg passed
        if(nargin==7)
            p4 = plot(xx, f(xx), 'Color','#a49127');
            set(p4, 'DisplayName', 'f(x)');
        end
    end

    % Metodo delle iterazioni di punto fisso

    while it<nmax && err>toll
        x_prev = x;
        x = phi(x);
        err = abs(x-x_prev);
        succ = [succ;x];
        it = it+1;
        
        if(nargin>4)
            % iteration plotting
            plot([x x], [phi(x_prev) phi(x)], '-', 'MarkerSize', 10, 'Color', [0 0.5 0],'Parent', hgit);
            plot([x_prev x], [phi(x_prev) phi(x_prev)], '-', 'MarkerSize', 10, 'Color', [0 0.5 0],'Parent', hgit);
        end
    end
    
    % results output
    if(it < nmax)
        fprintf("il metodo delle iterazioni di punto fisso converge in %d iterazioni\n",it);
        fprintf("alpha: %f\n",succ(end));
    else
        fprintf("il metodo delle iterazioni di punto fisso non converge in %d iterazioni\n",it);
    end
    
    if(nargin>4)
        % Plot result line
        p5 = plot([succ(end) succ(end)], [0 phi(succ(end))], '--', 'LineWidth', 1, 'Color', 'k');    % first iteration
        p5.Annotation.LegendInformation.IconDisplayStyle = 'off';
    
        % Add labels to axes
        xlabel('x');
        ylabel('y');
        title('ptofis');
    
        % Add grid
        grid on;
        grid minor;
    
        % Add legend
        set(get(get(hgit, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'on');
        set(hgit, 'DisplayName', 'Successione iterazioni MPF');
    
        legend('show');
    end
    return

end