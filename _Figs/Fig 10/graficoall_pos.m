meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10a
ss_1 = [149	198	276	338	394	435	470	518	552	604	657]; %1g
ss_2 = [144	200	273	358	408	481	513	552	565	618	671]; %fbg
ss_3 = [142	189	271	347	401	461	498	534	564	609	652]; %2g
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
	str = strcat('Fig10a_d', num2str(i));
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
	str = strcat('Fig10b_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10c
aux_res_1 = [213152.4574	299327.3612	494539.0231	779410.2033	1099272.599	1713279.546	2388032.049	3106160.427	4217383.512	5261909.557	6997589.738 ];
aux_res_2 = [143887.4873	213921.7757	421229.6598	680260	1141744.266	1684452.526	2368996.639	3202390.116	4388864.879	5400700.958	6774651.649 ];
aux_res_3 = [79859.45469	163288.8745	370444.0478	636178.4011	957707.2897	1383080.734	1858733.578	2483321.577	3160796.702	3985946.405	4942799.414 ];
aux_res_4 = [186560.1498	423943.5362	1158864.56	2352486.125	4127181.608	6702238.459	10101342.33	14439426.26	19768470.97	26105562.67	33434844.61 ];

elp(1).mat=[meff', aux_res_1'];
elp(2).mat=[meff', aux_res_2'];
elp(3).mat=[meff', aux_res_3'];
elp(4).mat=[meff', aux_res_4'];

for i=1:4
	elp(i).var_names={'meff','ron'};
	
	clear str;
	str = strcat('Fig10c_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10d
aux_res_out_1 = [1.52E+01	2.13E+03	1.37E+04	9.19E+03	5.80E+03	3.83E+03	2.66E+03	1.92E+03	1.44E+03	1.11E+03	8.82E+02 ];
aux_res_out_2 = [3.98E+03	3.01E+04	1.33E+05	2.07E+05	1.88E+05	1.41E+05	1.02E+05	7.46E+04	5.60E+04	4.32E+04	3.41E+04 ];
aux_res_out_3 = [6.79E+03	6.91E+03	3.84E+03	2.23E+03	1.38E+03	1.13E+03	6.66E+02	4.50E+02	3.03E+02	2.25E+02	1.82E+02 ];
aux_res_out_4 = [1.16E+02	1.41E+02	1.18E+02	7.52E+01	4.66E+01	2.95E+01	1.91E+01	1.27E+01	8.62E+00	6.01E+00	4.29E+00 ];

elp(1).mat=[meff', aux_res_out_1'];
elp(2).mat=[meff', aux_res_out_2'];
elp(3).mat=[meff', aux_res_out_3'];
elp(4).mat=[meff', aux_res_out_4'];

for i=1:4
	elp(i).var_names={'meff','gmr0'};
	
	clear str;
	str = strcat('Fig10d_d', num2str(i));
	elp(i).title=str;
	
	save_elpa(['Data/',elp(i).title,'.elpa'],elp(i))
end