function plot_elpa(op,list,file,level)

% %% Auswahl der darzustellen Transfer-ELPA-Daten
% %Moeglichkeit 1 (vorgefertigte Templates nutzen)
% dat_list={'-Isum(V)','ft(V)','ft(I)','gm(I)','gm(V)','cg(V)','cg(I)'};
% %Moeglichkeit 2 (direkte Angabe von x und y)
% dat_list={{'Qn','VG1'},{'Qp','VG1'}};
% %Moeglichkeit 3 (plotyy-Dartstellungen)
% dat_list={{{'Qn','Qp'},'VG1'}};
% %Moeglichkeit 4 (Kombination aus allem)
% dat_list={'Isum(V)','ft(V)',{'Qn','Isum'},{{'Qn','Qp'},'Isum'}};
% %NEU: 04.01.2010 Moeglichkeit 5 (verschiedene y über ein x)
% dat_list={'Qn','Qp','VG1'};

list_default={...
  'Isum(V)','-Isum(V)',...
  'gm_norm(I)','gm_norm(-I)','gm(V)','-gm(V)','gm(I)','gm(-I)',...
  'ft(I)','ft(-I)','ft(V)','-ft(V)',...
  'Qsum(V)','Qsum(I)','QG(V)','QG(I)',...
  '-cg(V)','cg(V)','cg(I)','cq(V)','cq(I)','cqn(V)','cqn(I)','cq(psi)'};

if nargin<2 || any(strcmp(list,'*')),
   list    = list_default;
   level   = 1;
   file    = [];
elseif nargin<3
   level   = 1;
   file    = [];
elseif nargin<4
   level   = 1;
end

if isempty(file)
   file    = cell(size(op,2),1);
   for i = 1:length(file),
      file{i} = ['var',num2str(i)];
   end
end


file_id = 1:size(op,2);
vd_id   = ones(size(op,1),max(file_id));

%color_list=['r','r','r','r','b','b','b'];
%color_list=['b','b','b','b','r','r','r'];
%usando%color_list=['b','b','b','b','b','r','r','r','r'];
color_list=['y','b','r','b','b','b','r','r','r'];
%color_list=['g','b','r','c','m','y','k'];
marker_list=['x','o','s','d'];

for k=1:length(list)
   var=list{k};
   [scal,var]=get_scal(var);
   if level==0,
      for numscal=1:length(scal),
         scal(numscal)=sign(scal(numscal))*1;
      end
   end
   if ~iscell(var{1}),
      figure;
      lgnd=[];
      for i=1:length(file_id),
         n_file=file_id(i);
         for j=1:size(vd_id,1)
            n_vparam=vd_id(j,i); %%HIER j,i???
            if n_vparam~=0,
               for n_var=1:length(var)-1
                  if isfield(op(j,n_file),char(var{n_var})) && ~isempty(op(j,n_file).(var{n_var}))
                     if imag(scal(length(var)))==0
                        x=scal(length(var))*op(j,n_file).(var{length(var)});
                     else
                        x=abs(real(scal(length(var)))*op(j,n_file).(var{length(var)}));
                     end
                     if imag(scal(n_var))==0
                        y=scal(n_var)*op(j,n_file).(var{n_var});
                     else
                        y=abs(real(scal(n_var))*op(j,n_file).(var{n_var}));
                     end
                     plot(x,y ...
                        , color_list(mod(n_file,length(color_list))+1) ...
                        , 'LineWidth',1);% ...
                        %, 'Marker',marker_list(mod(n_vparam,length(color_list))+1) ...
                        %);
                        axis([-2 2 -35 35]);
                  end
                  hold on
                  lgnd=[lgnd, {[char(var{n_var}),'-',char(file(file_id(i)))]}];
               end
            end
         end
      end
      %h=xlabel(char(var{length(var)}));
      %h=xlabel('V_{ds} (V)');
      %set(h,'Interpreter','tex')
      %h=ylabel(char(var{1:length(var)-1}));
      
      %h=ylabel('Drain current (A)');
      %set(h,'Interpreter','none')
      xlabel('V_{ds} (V)');
      ylabel('I_{ds} (\muA)')
       
      %h=legend(lgnd);
      %h=legend('n-type', 'p-type', 'Location', 'south');
      
      %set(h,'Interpreter','none');
        grid on;
% annotation('textbox','String','V_{GS} = -0.5','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.128 0.38 0.156 0.07037] ,'FitBoxToText','on');
% 
% annotation('textbox','String','V_{GS} = -1.0','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.128 0.23 0.156 0.07037] ,'FitBoxToText','on');
% 
% annotation('textbox','String','V_{GS} = -1.5','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.128 0.17 0.156 0.07037] ,'FitBoxToText','on');
% 
% annotation('textbox','String','V_{GS} = -2.0','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.328 0.18 0.156 0.07037] ,'FitBoxToText','on');
% 
% 
% annotation('textbox','String','V_{GS} = 0.5','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.747 0.65 0.149 0.07037] ,'FitBoxToText','on');
% 
% annotation('textbox','String','V_{GS} = 1.0','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.747 0.80 0.149 0.07037] ,'FitBoxToText','on');
% 
% annotation('textbox','String','V_{GS} = 1.5','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.747 0.85 0.149 0.07037] ,'FitBoxToText','on');
% 
% annotation('textbox','String','V_{GS} = 2.0','Interpreter','tex','FontSize', 12, 'LineStyle', 'none', 'Position', [0.600 0.85 0.149 0.07037] ,'FitBoxToText','on');

     
   elseif iscell(var{1})
      figureyy=figure();
      axes_left = axes('Parent',figureyy);
      axes_right= axes('Position',get(axes_left,'Position'),...
         'YAxisLocation','right','Color','none','Parent',figureyy);
      hold(axes_left,'all');
      hold(axes_right,'all');
      box(axes_left,'on');
      lgnd=[];
      for i=1:length(file_id),
         n_file=file_id(i);
         for j=1:size(vd_id,2)
            n_vparam=vd_id(i,j);
            if n_vparam~=0,
               ploty1 = plot(scal(3)*op(n_vparam,n_file).(var{2}),scal(1)*op(n_vparam,n_file).(var{1}{1}),...
                  color_list(2*(ceil((mod(i,length(color_list))+1)/2))-1),...
                  'LineWidth',2, ...
                  'Parent',axes_left);
               ploty2= plot(scal(3)*op(n_vparam,n_file).(var{2}),scal(2)*op(n_vparam,n_file).(var{1}{2}),...
                  color_list(2*(floor(mod(i,length(color_list))+1)/2)),...
                  'LineWidth',2, ...
                  'Parent',axes_right);
               lgnd=[lgnd, {[char(var{1}{1}),'-',char(file(file_id(i)))]}, ...
                  {[char(var{1}{2}),'-',char(file(file_id(i)))]}];
            end
         end
      end
      h=xlabel(char(var{2}));
      set(h,'Interpreter','none')
      h=ylabel(axes_left,char(var{1}{1}));
      set(h,'Interpreter','none')
      h=ylabel(axes_right,char(var{1}{2}));
      set(h,'Interpreter','none')
      %         h=legend(lgnd);
      %         set(h,'Interpreter','none')
   else
      fprintft('Fehler!\n');
   end
   
end
end
