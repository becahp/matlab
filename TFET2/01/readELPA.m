function [MAT,names,tline1]=readELPA(file)

try
  fid=fopen(file);
% get first line (comments);
  tline1=fgets(fid);
% get second line (column names)
  tline=fgets(fid);
  fclose(fid);
% interprete second line
  names=textscan(tline,'%s');
  count=str2double(names{1}{1}); %no. of columns
  st=2;
  if isnan(count),count=length(names{1});st=1;end
  names=names{1}(st:end); %save column names
% get data
  MAT=dlmread(file,'',2,0); % skip first 2 lines
catch
  fprintf(['ELPA read error (',strrep(file,'\','\\'),')\n']);
  MAT=[];  names='';  tline1='';
end