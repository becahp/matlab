function [scal,var,m]=get_scal(list,m)

if nargin==1
  m=0;
end

if iscell(list)
  for i=1:length(list),
    if ~iscell(list{i})
      m=m+1;
      scal(m)=1;
      if strncmp(list{i},'-',1)
        list{i}=list{i}(2:end);
        scal(m)=-1;
      elseif strncmp(list{i},'|',1)
        list{i}=list{i}(2:end-1);
        scal(m)=scal(m)+sqrt(-1);
      end
      if strncmp(list{i},'I',1) || strncmp(list{i},'i',1) || strncmp(list{i},'gm',2) || strncmp(list{i},'dI',2) || strncmp(list{i},'Re_',3)
        scal(m)=scal(m);%*1e6;
      elseif strncmp(list{i},'c',1) || strncmp(list{i},'Q',1)
        scal(m)=scal(m);
      elseif strncmp(list{i},'ft',2)
        scal(m)=scal(m);%*1e-12;
      end
      if strncmp(list{i},'#',1)
        list{i}=list{i}(2:end);
        scal(m)=1;
      end
      var{m}=list{i};
    else
      [scal,m]=get_scal(list{i},m);
    end
  end
end  
