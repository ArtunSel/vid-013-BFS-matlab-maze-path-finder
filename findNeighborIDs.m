function out=findNeighborIDs(XID,nodeList,nodeID)
% XID=[1,2,3,4;
%      5,6,7,8;
%      9,10,11,12;
%      13,14,15,16];
    max_row_no=size(XID,1);
    max_col_no=size(XID,2);
%%
% find the row-col location of the given nodeID
[row,col]=ID2RowCol(XID,nodeList,nodeID);

    m1=[row+1,col;
        row-1,col;
        row,col+1;
        row,col-1];
    m2=[];
    for ii=1:1:size(m1,1)
        if m1(ii,1)>0 && m1(ii,1)<=max_row_no
            if m1(ii,2)>0 && m1(ii,2)<=max_col_no
                m2=[m2;m1(ii,:)];
            end
        end
    end
    %---------------
    out=[];
    % [r1,c1]->ID1
    % [r2,c2]->ID2
    %% find the IDs of the nodes that are located at the given "row,col"
    for ii=1:1:size(m2,1)
%         [IDno]=RowCol2ID(XID,nodeList,row,col)
        out=[out,RowCol2ID(XID,nodeList,m2(ii,1),m2(ii,2))];
    end
end



% % function out=findNeighborIDs(nodeList,nodeID)
% % %% get the row,col number of the "MAP"
% % max_row_no=0;
% % max_col_no=0;
% % for ii=1:1:numel(nodeList)
% %     tempNode=nodeList(ii);
% %     if tempNode.location(1)>max_row_no
% %         max_row_no=tempNode.location(1);
% %     end
% %     if tempNode.location(2)>max_col_no
% %         max_col_no=tempNode.location(2);
% %     end
% % end
% % %%
% % % find the row-col location of the given nodeID
% % for ii=1:1:numel(nodeList)
% %     if nodeList(ii).ID==nodeID
% %         nodeLocation=nodeList(ii).location;
% %         break;
% %     end
% % end
% %     m1=[nodeLocation(1)+1,nodeLocation(2);
% %         nodeLocation(1)-1,nodeLocation(2);
% %         nodeLocation(1),nodeLocation(2)+1;
% %         nodeLocation(1),nodeLocation(2)-1];
% %     m2=[];
% %     for ii=1:1:size(m1,1)
% %         if m1(ii,1)>0 && m1(ii,1)<=max_row_no
% %             if m1(ii,2)>0 && m1(ii,2)<=max_col_no
% %                 m2=[m2;m1(ii,:)];
% %             end
% %         end
% %     end
% %     %---------------
% %     out=[];
% %     %% find the IDs of the nodes that are located at the given "row,col"
% %     for ii=1:1:size(m2,1)
% %         for jj=1:1:numel(nodeList)
% %             if nodeList(jj).location(1)==m2(ii,1) && nodeList(jj).location(2)==m2(ii,2)
% %                 out=[out,nodeList(jj).ID];
% %             end
% %         end
% %     end
% % end