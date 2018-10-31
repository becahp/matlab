meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10a
ss_1 = [145	192	260	323	392	438	473	521	554	606	659]; %1g
ss_2 = [147	203	273	362	412	487	522	558	570	624	677]; %fbg
ss_3 = [146	190	271	347	401	461	498	534	564	609	652]; %2g
ss_4 = [61	62	66	66	70	75	80	87	93	100	108]; %3g

ss60 = [60	60	60	60	60	60	60	60	60	60	60]; %1g
meff2 = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

elp(1).mat=[meff', ss_1'];
elp(2).mat=[meff', ss_2'];
elp(3).mat=[meff', ss_3'];
elp(4).mat=[meff', ss_4'];
elp(5).mat=[meff2', ss60'];

for i=1:5
	elp(i).var_names={'meff','ss'};
	
	clear str;
	str = strcat('Fig10scaleda_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10b
peak_gm_1 = [3.86478366	2.68981853	1.79457706	1.105977603	0.688419343	0.452028599	0.3129387	0.225674898	0.168263608	0.128900231	0.100982694];
peak_gm_2 = [6.582491648	4.325385795	2.177708947	1.179067065	0.70638545	0.45805295	0.315035691	0.226533477	0.168631207	0.129055201	0.101040279];
peak_gm_3 = [8.128625626	5.201289983	2.348398291	1.24783523	0.745422637	0.482729636	0.331852598	0.238027557	0.177667754	0.136009641	0.10651512];
peak_gm_4 = [7.086419129	3.355854077	1.130115526	0.508053557	0.274643103	0.165664114	0.107785232	0.07811188	0.057993989	0.045415537	0.03787989];

elp(1).mat=[meff', peak_gm_1'];
elp(2).mat=[meff', peak_gm_2'];
elp(3).mat=[meff', peak_gm_3'];
elp(4).mat=[meff', peak_gm_4'];

for i=1:4
	elp(i).var_names={'meff','peak_gm'};
	
	clear str;
	str = strcat('Fig10scaledb_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10c
aux_res_1 = [101804.970204222	173261.147751783	380079.588472743	686337.336866843	1107342.15709388	1658334.31039824	2353943.82403618	3212029.41152276	4232722.50492485	5439705.65316226	6838734.91701223 ];
aux_res_2 = [127172.946004926	199260.419138738	409586.872227458	721014.423340244	1148774.25398694	1708332.04391279	2414183.31460539	3279649.91527994	4316839.57018463	5536648.70832225	6948793.88076853 ];
aux_res_3 = [78541.8035968097	161836.444041456	368098.081998262	632963.890738411	966434.333420370	1377769.29600885	1877693.78777618	2475769.60688113	3179955.30847559	4001286.59090440	4946457.43895831 ];
aux_res_4 = [186560.1498	423943.5362	1158864.56	2352486.125	4127181.608	6702238.459	10101342.33	14439426.26	19768470.97	26105562.67	33434844.61 ];


elp(1).mat=[meff', aux_res_1'];
elp(2).mat=[meff', aux_res_2'];
elp(3).mat=[meff', aux_res_3'];
elp(4).mat=[meff', aux_res_4'];

for i=1:4
	elp(i).var_names={'meff','ron'};
	
	clear str;
	str = strcat('Fig10scaledc_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10d
%aux_res_out_1 = [1671310533.88718	4577587377.81997	3946595756.17770	2603272089.36946	1733912030.73042	1201841938.76032	865998198.276165	645841158.995907	496213050.314882	391179784.752246	315319041.472500];
%aux_res_out_2 = [4213011213.30003	29386263793.4537	116190239499.763	156092871733.335	132822671677.328	98280447335.3309	71584787515.9229	53091329979.1796	40358244866.5475	31455538219.9606	25086034123.5858];
%aux_res_out_3 = [5776583677.28093	5487006604.39031	2554240894.50463	1583862696.32965	941461598.602357	641634558.650045	448747719.298751	296703983.868829	207710365.128844	148939566.438399	115201220.723494];
%aux_res_out_4 = [100779836.411520	125305595.287612	107905951.496949	68238253.7753437	41275451.0787042	25407316.2283482	16100716.7438698	10513963.0802109	7077815.43026182	4894696.02215623	3471672.40506504];


gm_1 = [6.97755800173665	3.00882039409240	0.935206175083918	0.414939304702741	0.220470946940662	0.130851913784314	0.0838825080639364	0.0569687679118737	0.0404874533257543	0.0298554429921834	0.0227006288657586  ];
gm_2 = [6.74092589758625	2.98168019349650	0.933265688264160	0.414796840059479	0.220604622126417	0.131048377080424	0.0840653268394031	0.0571825921530818	0.0406991324939502	0.0300628311813551	0.0229027464189006  ];
gm_3 = [7.70538755503538	3.24821786667140	1.01201054760588	0.451652937915167	0.241405579043134	0.144113580510638	0.0928968659752380	0.0621464576314648	0.0453246389621046	0.0336085527531976	0.0257039326910529  ];
gm_4 = [1.99973792349981	0.510268972882700	0.110290062482718	0.0401690656801266	0.0184290680838218	0.00964321593223248	0.00550192702912635	0.00334423481250816	0.00213627921660219	0.00142141772606604	0.000979079780734301];

r0_1 = [245903757.153046	1535032951.38023	4234729345.30315	6287872927.06371	7879571711.12130	9200811034.62691	10341238119.5569	11355348811.5585	12275868685.1026	13123653428.1933	13912782540.3031 ];
r0_2 = [652779145.900329	10089043719.8473	126559107711.146	381847666603.082	610775679988.615	760697008583.256	863386803482.429	941543544092.297	1005717367132.26	1061187650665.51	1110878371801.82 ];
r0_3 = [917578520.933245	2040575962.89974	2670102521.65551	4394435474.32862	5050155003.69253	6340681811.72407	6256719725.90302	7981608110.31720	6091193407.16359	5984686432.24643	6050078118.69890 ];
r0_4 = [58170689.2608489	275897820.854422	1072046604.89700	1871324240.58932	2529089333.87969	3054647935.83737	3463833556.76243	3783031825.46385	4032895880.60231	4230164402.91642	4384728710.32813 ];

aux_res_out_1 = gm_1 .* r0_1 .* 1e-06;
aux_res_out_2 = gm_2 .* r0_2 .* 1e-06;
aux_res_out_3 = gm_3 .* r0_3 .* 1e-06;
aux_res_out_4 = gm_4 .* r0_4 .* 1e-06;


elp(1).mat=[meff', aux_res_out_1'];
elp(2).mat=[meff', aux_res_out_2'];
elp(3).mat=[meff', aux_res_out_3'];
elp(4).mat=[meff', aux_res_out_4'];

for i=1:4
	elp(i).var_names={'meff','gmr0'};
	
	clear str;
	str = strcat('Fig10scaledd_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end