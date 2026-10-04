%% Mass (kg) vs ADC: Run 1, Run 2, Run 4
clear; clc; close all;

%% ===== Run 1 =====
R1 = load('../Processed_Result/result_run1.mat');
p1 = polyfit(R1.mass1, R1.mu1, 1);
fit1 = polyval(p1, R1.mass1);

figure;
plot(R1.mass1, R1.mu1, '-o', 'LineWidth', 1.6, 'MarkerSize', 6); hold on;
plot(R1.mass1, fit1, '--', 'LineWidth', 1.4);
grid on;
xlabel('Mass (kg)');
ylabel('ADC (count)');
title('Mass vs ADC - Run 1');
legend('Measured ADC','Linear fit','Location','northwest');

%% ===== Run 2 =====
R2 = load('../Processed_Result/result_run2.mat');
p2 = polyfit(R2.mass_run2, R2.mu2, 1);
fit2 = polyval(p2, R2.mass_run2);

figure;
plot(R2.mass_run2, R2.mu2, '-o', 'LineWidth', 1.6, 'MarkerSize', 6); hold on;
plot(R2.mass_run2, fit2, '--', 'LineWidth', 1.4);
grid on;
xlabel('Mass (kg)');
ylabel('ADC (count)');
title('Mass vs ADC - Run 2');
legend('Measured ADC','Linear fit','Location','northwest');

%% ===== Run 4 =====
R4 = load('../Processed_Result/result_run4.mat');
p4 = polyfit(R4.mass_run4, R4.mu4, 1);
fit4 = polyval(p4, R4.mass_run4);

figure;
plot(R4.mass_run4, R4.mu4, '-o', 'LineWidth', 1.6, 'MarkerSize', 6); hold on;
plot(R4.mass_run4, fit4, '--', 'LineWidth', 1.4);
grid on;
xlabel('Mass (kg)');
ylabel('ADC (count)');
title('Mass vs ADC - Run 4');
legend('Measured ADC','Linear fit','Location','northwest');
