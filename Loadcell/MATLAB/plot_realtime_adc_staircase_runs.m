%% Real-time ADC staircase: Run 1, Run 2, Run 4
clear; clc; close all;

bag = [991 971 980 1001 976 1011 996 994 983 973]; % g
mass = [0 cumsum(bag)]'/1000;                       % kg

files = {'../Raw_Data/run1.mat','../Raw_Data/run2.mat','../Raw_Data/run4.mat'};
runNo = [1 2 4];

for r = 1:numel(files)
    S = load(files{r});
    data = S.data;

    adcSig  = data.get('adc');
    markSig = data.get('mark');

    t = adcSig.Values.Time;
    y = double(adcSig.Values.Data(:));
    m = double(markSig.Values.Data(:));

    d = diff([0; m; 0]);
    s = find(d == 1);
    e = find(d == -1) - 1;

    figure;
    plot(t, y, 'LineWidth', 0.8);
    grid on;
    xlabel('Time (s)');
    ylabel('ADC (count)');
    title(sprintf('Real-Time ADC Response - Run %d', runNo(r)));

    hold on;
    n = min(numel(s), numel(mass));
    for k = 1:n
        tmid = (t(s(k)) + t(e(k))) / 2;
        ymid = mean(y(s(k):e(k)));
        text(tmid, ymid + 65, sprintf('%.3f kg', mass(k)), ...
            'HorizontalAlignment','center', ...
            'VerticalAlignment','bottom', ...
            'FontSize',8);
    end
    hold off;
end
