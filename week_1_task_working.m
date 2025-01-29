% Task 1

task_1a = (3 + 4) / (5 + 6);  % (3 + 4) / (5 + 6)
task_1b = 2 * pi^2;           % 2 * pi^2
task_1c = sqrt(2);            % sqrt(2)
task_1d = ((1.23 * 10^ -5) + (5.67 * 10^-3)) * (4.567 * 10^-3); % ((1.23 * 10^-5) + (5.67 * 10^-3)) * (4.567 * 10^-3)

% Task 2

c = 37;  % Celsius value
f = (c * 9 / 5) + 32;  % Convert Celsius to Fahrenheit

% Displaying results for Task 1
disp('Task 1 Results:');
disp(['task_1a: ', num2str(task_1a)]);
disp(['task_1b: ', num2str(task_1b)]);
disp(['task_1c: ', num2str(task_1c)]);
disp(['task_1d: ', num2str(task_1d)]);

% Displaying result for Task 2
disp(['Task 2 Result (Fahrenheit): ', num2str(f)]);

% Sorting the results
task_results = [task_1a, task_1b, task_1c, task_1d, f];
sorted_results = sort(task_results);

% Display sorted results
disp('Sorted Results:');
disp(sorted_results);
