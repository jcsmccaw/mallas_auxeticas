%% Error Bars: 

figure(1) 
subplot(3,2,1)
err1 = errorbar(11.01943333,	22.04056667,	4.953115999,	4.953115999,	1.153179224,	1.153179224,	'b.');
err2 = errorbar(10.45563333,	17.81253333,	4.252972563,	4.252972563,	0.502268477,	0.502268477,	'r.');
err3 = errorbar(19.22593333,	25.37906667,	1.268497443,	1.268497443,	0.083886491,	0.083886491,	'k.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'r')
set(err2,'Color', 'b')
set(err3,'Color', 'k')
err1.Bar.LineStyle = 'dashdot';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'solid';


subplot(3,2,3)
err1 = errorbar(17.22933333,	21.78786667,	1.187223489,	1.187223489,	1.817663438,	1.817663438,	'k.');
err2 = errorbar(11.18876667,	21.27163333,	3.476754496,	3.476754496,	0.817051898,	0.817051898,	'b.');
err3 = errorbar(11.22956667,	22.15566667,	6.315596205,	6.315596205,	0.571681085,	0.571681085,	'r.')
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';



subplot(3,2,5)
err1 = errorbar(13.8261,	19.27096667,	3.108110159,	3.108110159,	1.426954242,	1.426954242,	'k.');
err2 = errorbar(13.1661,	18.83873333,	1.258700319,	1.258700319,	1.383104381,	1.383104381,	'b.');
err3 = errorbar(13.10813333,	23.0484,	4.407569711,	4.407569711,	0.647699794,	0.647699794,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';




subplot(3,2,2)
err1 = errorbar(19.56963333,	24.38453333,	0.887592442,	0.887592442,	0.048979826,	0.048979826,	'k.');
err2 = errorbar(12.50503333,	29.58773333,	2.081687069,	2.081687069,	0.615610123,	0.615610123,	'b.');
err3 = errorbar(11.18753333,	22.6809,	5.288871627,	5.288871627,	0.541643705,	0.541643705,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';





subplot(3,2,4)
err1 = errorbar(17.58713333,	30.89826667,	2.251620488,	2.251620488,	1.857545037,	1.857545037,	'k.');
err2 = errorbar(14.3435,	38.87986667,	1.823111638,	1.823111638,	0.235363995,	0.235363995,	'b.');
err3 = errorbar(10.748,	18.03226667,	3.776145037,	3.776145037,	0.346086391,	0.346086391,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';




subplot(3,2,6)
err1 = errorbar(14.53506667,	22.40323333,	2.565903763,	2.565903763,	0.319769078,	0.319769078,	'k.');
err2 = errorbar(13.09363333,	20.25806667,	7.245368624,	7.245368624,	2.377683012,	2.377683012,	'b.');
err3 = errorbar(11.71133333,	17.85486667,	5.488334863,	5.488334863,	1.967272107,	1.967272107,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';





figure(2)


subplot(3,2,1)
err1 = errorbar(18.00663333,	4.329033333,	0.233319531,	0.233319531,	1.861491083,	1.861491083,	'k.');
err2 = errorbar(12.2415,	4.032233333,	0.821463099,	0.821463099,	2.52586542,	2.52586542,	'b.');
err3 =  errorbar(17.0278,	8.462366667,	0.63318004,	0.63318004,	2.658676793,	2.658676793,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';




subplot(3,2,3)
err1 = errorbar(17.6099,	4.559566667,	0.58211993,	0.58211993,	2.313258565,	2.313258565,	'k.');
err2 = errorbar(16.44715,	5.75135,	1.501116986,	1.501116986,	3.993526968,	3.993526968,	'b.');
err3 = errorbar(17.47396667,	8.552133333,	0.794159722,	0.794159722,	1.602579437,	1.602579437,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')

set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';




subplot(3,2,5)
err1 = errorbar(16.00663333,	4.851366667,	0.832193105,	0.832193105,	0.566756115,	0.566756115,	'k.');
err2 = errorbar(18.3644,	5.866833333,	0.976401978,	0.976401978,	0.126371397,	0.126371397,	'b.');
err3 = errorbar(18.2945,	4.116866667,	0.129433934,	0.129433934,	1.42102507,	1.42102507,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')


set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';



subplot(3,2,2)
err1 = errorbar(16.9612,	3.037633333,	0.548716979,	0.548716979,	0.972881766,	0.972881766,	'k.');
err2 = errorbar(18.44396667,	5.3742,	0.445290164,	0.445290164,	0.358448857,	0.358448857,	'b.');
err3 = errorbar(14.24283333,	10.14623333,	0.340705479,	0.340705479,	0.668325978,	0.668325978,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')


set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';




subplot(3,2,4)
err1 = errorbar(18.1143,	4.848233333,	0.089800019,	0.089800019,	1.256000621,	1.256000621,	'k.');
err2 = errorbar(17.83866667,	6.635933333,	0.237570881,	0.237570881,	1.415833438,	1.415833438,	'b.');
err3 = errorbar(16.21513333,	6.887333333,	0.333235447,	0.333235447,	0.728689978,	0.728689978,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')


set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';



subplot(3,2,6)
err1 = errorbar(17.7519,	5.536033333,	1.192359268,	1.192359268,	0.522630395,	0.522630395,	'k.');
err2 = errorbar(18.6711,	6.238233333,	0.031407855,	0.031407855,	0.302847354,	0.302847354,	'b.');
err3 = errorbar(17.46136667,	4.616833333,	1.325413808,	1.325413808,	0.923743765,	0.923743765,	'r.');
hline = findobj(gca, 'type', 'line');
set(hline(1), 'Color', 'r')
set(hline(2),'Color', 'b')
set(hline(3),'Color', 'k')


set(err1, 'Color', 'k')
set(err2,'Color', 'b')
set(err3,'Color', 'r')
err1.Bar.LineStyle = 'solid';
err2.Bar.LineStyle = 'dashed';
err3.Bar.LineStyle = 'dashdot';