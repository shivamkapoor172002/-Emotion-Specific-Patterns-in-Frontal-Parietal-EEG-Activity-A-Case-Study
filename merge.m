% Contents of combined_plot.m
% Call the other scripts and combine the plots

% Run the horror script
run('horror.m');

% Store the horror data (modify as needed based on your code)
common_time_horror = common_time;  % Assuming you have common_time variable in horror.m
interpolated_horror_data = interpolated_horror_data;  % Assuming you have this variable in horror.m

% Run the comedy script
run('comedy.m');

% Store the comedy data (modify as needed based on your code)
common_time_comedy = common_time;  % Assuming you have common_time variable in comedy.m
interpolated_comedy_data = interpolated_comedy_data;  % Assuming you have this variable in comedy.m

% Run the patriotic script
run('patriotic.m');

% Store the patriotic data (modify as needed based on your code)
common_time_patriotic = common_time;  % Assuming you have common_time variable in patriotic.m
interpolated_patriotic_data = interpolated_patriotic_data;  % Assuming you have this variable in patriotic.m

% Plot all three genres in a single plot
figure;
plot(common_time_horror, interpolated_horror_data, 'LineWidth', 1.5, 'Color', 'red');
hold on;
plot(common_time_comedy, interpolated_comedy_data, 'LineWidth', 1.5, 'Color', 'green');
plot(common_time_patriotic, interpolated_patriotic_data, 'LineWidth', 1.5, 'Color', 'blue');

title('Combined Smoothed EEG Data for All Genres');
legend('Horror', 'Comedy', 'Patriotic'); % Add legend for all genres
xlabel('Time (seconds)');
ylabel('Amplitude');
