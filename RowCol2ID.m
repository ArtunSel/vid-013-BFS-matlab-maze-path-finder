function [IDno]=RowCol2ID(XID,nodeList,row,col)
% XID=[1,2,3,4;
%      5,6,7,8;
%      9,10,11,12;
%      13,14,15,16];
    IDno=XID(row,col);
end







% function [IDno]=RowCol2ID(nodeList,row,col)
% % XID=[1,2,3,4;
% %      5,6,7,8;
% %      9,10,11,12;
% %      13,14,15,16];
% %% get the row,col number of the "MAP"
% max_row_no=0;
% max_col_no=0;
% for ii=1:1:numel(nodeList)
%     tempNode=nodeList(ii);
%     if tempNode.location(1)>max_row_no
%         max_row_no=tempNode.location(1);
%     end
%     if tempNode.location(2)>max_col_no
%         max_col_no=tempNode.location(2);
%     end
% end
% % generate XID
% XID=zeros(max_row_no,max_col_no);
% kk=1;
% for rr=1:1:max_row_no
%     for cc=1:1:max_col_no
%         XID(rr,cc)=kk;
%         kk=kk+1;
%     end
% end
% %%
%     IDno=XID(row,col);
%     return;
% end