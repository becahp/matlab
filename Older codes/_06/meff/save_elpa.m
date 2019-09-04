function save_elpa(fname,elp,options)
%%% elp.title     - title of elpa file
%%% elp.info      - additional info for title of elpa file
%%% elp.var_names - names of variables
%%% elp.mat       - matrix with data to be saved
%%% options       - struct with parameters
%%%                 options.header = 1 or 0  - with or w/o header files
%%%                 options.format = 'elpa' or 'z' - ELPA, z-file for GLE
%%% Example
%%%
%%% elp.mat=[opdc(1).VG1,opdc(1).Isum,opdc(2).Isum,opdc(1).gm,opdc(2).gm];
%%% elp.var_names={'VG1','I_0p01','I_0p4','gm_0p01','gm_0p4'};
%%% elp.title='FraLui12_10nm_FIT';
%%% save_elpa(['../documentation/data/',elp.title,'.elpa'],elp)

if nargin < 3
   options.header=1;
   options.format='elpa';
end

if ~isfield(elp,'info')
   elp.info=[];
end

fh=fopen(fname,'w');
if options.header && strcmp(options.format,'elpa')
   fprintf(fh,'%s\n',[elp.title,elp.info]);
end

if options.header
    if strcmp(options.format,'elpa')
       var_names=num2str(length(elp.var_names));
    else
       var_names=[];
    end
    for i=1:length(elp.var_names)
       var_names=[var_names,' ',elp.var_names{i}];
    end
   fprintf(fh,'%s\n',var_names);
end

for j=1:size(elp.mat,1)
    mat_str=sprintf('%e\t',elp.mat(j,:));
    fprintf(fh,'%s\n',mat_str);
end
fclose(fh);
fprintf('File saved!\n')
end