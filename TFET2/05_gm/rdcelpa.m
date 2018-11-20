function [step,file_idx,list_out]=rdcelpa(filename,list,opt,op)
% function for read in of elpa file generated with COOS
% filename: file name
% list    : list of variables to be read in; 
%           '*' = all but struct output,
%           '*n' = all but struct output with 'n' number of header lines to be
%           ignored (default n=2)
%           '!' = all but matrix output
%           '!n' = all but matrix output with 'n' number of header lines to be
%           ignored (default n=2)
%           output
% opt     : [optional] list of variables 
%           * first variable (sweep) determines sorting of output data
%           * [optional] second variable (parameter) splits the output data into a
%             parameter depending struct
% Example: [op]=rdcelpa('test.elpa',{'VD','VG1','Isum'},{'VG1'}); %VG1 is sorting variable
%          [op]=rdcelpa('test.elpa',{'VD','VG1','Isum'},{'VG1','VD'}; %VD is parameter
%          [op]=rdcelpa('test.elpa','*'); %all data is read into a struct
%          [op]=rdcelpa('test.elpa','!4'); %all data is read into a matrix
%          and the first 4 lines are ignored

switch nargin, 
  case 1
    list='*';
    opt={};
    op=[];   
  case 2
    opt={};
    op=[];
  case 3
    op=[];
  otherwise
    step=op;
end

if isempty(list)
    list='*';
end
if isempty(opt)
    opt={};
end

fid=fopen(filename,'r');

if fid<1,
  fprintf('ERROR: File %s does not exists!\n',filename)
  step=[];
  file_idx=false;
  return
end

%nc_list = length(char(list));
%if nc_list>1
%   nheadlines = str2num(list(2:end));
%else
   nheadlines = 2;
%end

if nheadlines > 0
   for i = 1:nheadlines,
      tline = fgetl(fid);
   end
   [str, tline] = strtok(tline);
   num_col=str2num(str);
   if isempty(num_col)
       num_col=0;
       tline=[str,' ',tline];
   end
   m=0;
   while true
      m=m+1;
      [str, tline] = strtok(tline);
      if isempty(str),  break; end
      elpa_list(m)={str};
   end
end
   

% if m-1~=num_col,
%   fprintf('ERROR: Check header of input file!\n')
%   step=[];
%   file_idx=false;
%   return
% end

if m-1~=num_col,
  fprintf('Warning: Check header of input file!\n')
  num_col=m-1;
  %step=[];
  %file_idx=false;
  %return
end

matrix_out=0;
if strncmp(char(list),'!',1)
   matrix_out=1;
end

fields_idx=zeros(1,num_col);
if strncmp(char(list),'*',1) || strncmp(char(list),'!',1)
    list=elpa_list;
end
for i=1:length(list)
    field_idx = strcmp(elpa_list, char(list(i)));
    if isempty(elpa_list(field_idx)),
        fprintf('ERROR: variable %s is not in file!\n',char(list(i)));
        step=[];
        file_idx=false;
        return
    end
    fields_idx=fields_idx | field_idx;
    list_idx(i)=find(field_idx);
end
[list_idx,srt_idx]=sort(list_idx);


fields_str=cell(1,num_col);
fields_str(fields_idx)={'%f'};
fields_str(~fields_idx)={'%*f'};


posi=ftell(fid);
tline = fgetl(fid);  
m=0;
while true
  m=m+1;
  [str, tline] = strtok(tline);
  if isempty(str),  break; end
end
tok_num=m-1;

mat=[];
fseek(fid,posi,'bof'); %eine Zeile zurück gehen
if tok_num==num_col,
  mat_str=[];
  for i=1:num_col,
    mat_str=[mat_str,char(fields_str(i)),' '];
  end
  mat = textscan(fid, mat_str);
  if ~any(any([mat{:}]))
    fprintf('ERROR: File %s is empty!\n',filename)
    file_idx=false;
    %  step=[];
    %  fclose(fid);
    %  return;
  else
    file_idx=true;
    fclose(fid);
  end
  mat=cell2mat(mat);
else
  line_num=1;
  m=0;
  col=0;
  tline=[];
  while true
    tline = fgetl(fid);
    if tline==-1
      break
    end
%     inp = textscan(fid, '%f %f %f %f %f %f',1);
    while true
      m=m+1;
      [str, tline] = strtok(tline);
      if isempty(str),  break; end
      if fields_idx
        col=col+1;
        mat(line_num,col)=str2double(str);
      end
    end
    m=m-1;
    if m==num_col,
      line_num=line_num+1;
      m=0;
      col=0;
    end
  end
  file_idx=true;
  fclose(fid);
end

if ~isempty(mat)
  [rn,cn]=size(mat);
else
  fprintf('There is something wrong with your input file %s!\n',filename);
  step=[];
  return
end

%% Postprocessing
list_out=strrep(list,'(', '_');
list_out=strrep(list_out,':', '_');
list_out=strrep(list_out,',', '');
list_out=strrep(list_out,')', '');
list_out=strrep(list_out,'+', 'plus');
list_out=strrep(list_out,'-', 'minus');
%%
wrn_flag=0;
if ~isempty(opt),
  for i=1:length(opt),
    wrn_idx = strcmp(list,char(opt(i)));
    if isempty(list(wrn_idx)),
      fprintf('ERROR: %s is not in variable list!\n',char(opt(i)));
      wrn_flag=1;
      step=[];
      return
    end
    opt_idx = strcmp(list, char(opt(i)));
    if isempty(list(opt_idx)),
      fprintf('ERROR: variable %s is not in file!\n',char(opt(i)));
      wrn_flag=1;
      step=[];
      return
    end
    idx(i)=find(opt_idx);
  end
else
  wrn_flag=1;
end

if wrn_flag==0,
  if length(idx)==2   %Sortieren + nach Parameter trennen
    j=0;
    while ~isempty(mat)
      j=j+1; %j entspricht Parameter, nach dem sortiert wird
      help=sortrows(mat(mat(1,idx(2))==mat(:,idx(2)),:),idx(1));
      for i=1:length(list),  %nach Parametern auftrennen   
        step(j,size(op,2)+1).(char(list_out(srt_idx(i))))=help(:,i);
      end     
      mat=mat(mat(1,idx(2))~=mat(:,idx(2)),:);
    end
  else    %nur Sortieren
    mat=sortrows(mat,idx(1));
    for i=1:length(list),
      step(1,size(op,2)+1).(char(list_out(srt_idx(i))))=mat(:,i);
    end
  end
else  % unsortiert ausgeben, op wird ignoriert
  if matrix_out==0 
     for i=1:length(list),
        step(1,size(op,2)+1).(char(list_out(srt_idx(i))))=mat(:,i);
     end
  else
     step=mat;
  end
end

