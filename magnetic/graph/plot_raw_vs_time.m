clc;
clear;
close all;

distance = [2.7 3.0 3.3];

B = zeros(3,3);

%% =========================
% เลือก Round 1
%% =========================
[files1, path1] = uigetfile('*.xlsx', ...
    'เลือกไฟล์ Round 1: 2.7, 3.0, 3.3 cm', ...
    'MultiSelect', 'on');

if ischar(files1)
    files1 = {files1};
end

for i = 1:length(files1)

    filename = files1{i};

    token = regexp(filename, ...
        'Round1-([0-9]+\.[0-9]+)', ...
        'tokens', 'once');

    dist = str2double(token{1});

    data = readtable(fullfile(path1, filename), ...
        'VariableNamingRule', 'preserve');

    idx = data.time >= 0.5 & data.time <= 10;

    B_avg = mean(data.B_gain1(idx));

    dist_index = find(abs(distance - dist) < 0.001);

    B(1, dist_index) = B_avg;
end


%% =========================
% เลือก Round 2
%% =========================
[files2, path2] = uigetfile('*.xlsx', ...
    'เลือกไฟล์ Round 2: 2.7, 3.0, 3.3 cm', ...
    'MultiSelect', 'on');

if ischar(files2)
    files2 = {files2};
end

for i = 1:length(files2)

    filename = files2{i};

    token = regexp(filename, ...
        'Round2-([0-9]+\.[0-9]+)', ...
        'tokens', 'once');

    dist = str2double(token{1});

    data = readtable(fullfile(path2, filename), ...
        'VariableNamingRule', 'preserve');

    idx = data.time >= 0.5 & data.time <= 10;

    B_avg = mean(data.B_gain1(idx));

    dist_index = find(abs(distance - dist) < 0.001);

    B(2, dist_index) = B_avg;
end


%% =========================
% เลือก Round 3
%% =========================
[files3, path3] = uigetfile('*.xlsx', ...
    'เลือกไฟล์ Round 3: 2.7, 3.0, 3.3 cm', ...
    'MultiSelect', 'on');

if ischar(files3)
    files3 = {files3};
end

for i = 1:length(files3)

    filename = files3{i};

    token = regexp(filename, ...
        'Round3-([0-9]+\.[0-9]+)', ...
        'tokens', 'once');

    dist = str2double(token{1});

    data = readtable(fullfile(path3, filename), ...
        'VariableNamingRule', 'preserve');

    idx = data.time >= 0.5 & data.time <= 10;

    B_avg = mean(data.B_gain1(idx));

    dist_index = find(abs(distance - dist) < 0.001);

    B(3, dist_index) = B_avg;
end


%% =========================
% Plot Repeatability
%% =========================
figure;

plot(distance, B(1,:), '-o', 'LineWidth', 2);
hold on;

plot(distance, B(2,:), '-o', 'LineWidth', 2);
plot(distance, B(3,:), '-o', 'LineWidth', 2);

hold off;

grid on;

title('Repeatability of Magnetic Flux Density', ...
    'FontSize', 16);

xlabel('Distance (cm)', 'FontSize', 14);
ylabel('Magnetic Flux Density (mT)', 'FontSize', 14);

legend('Round 1', 'Round 2', 'Round 3', ...
    'Location', 'best');

set(gca, 'FontSize', 14);
set(gca, 'LineWidth', 1.5);

xticks([2.7 3.0 3.3]);

%% แสดงค่า
disp('B gain1 average');
disp(B);