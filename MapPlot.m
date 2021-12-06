function []=MapPlot(XID,nodeList,noteIDs2Bplotted)
% XID=[1,2,3,4;
%      5,6,7,8;
%      9,10,11,12;
%      13,14,15,16];
    %% plot the MAP [for a given nodeList]
    max_row_no=size(XID,1);
    max_col_no=size(XID,2);
    stateMatrix=zeros(max_row_no,max_col_no);
    for ii=1:1:numel(nodeList)
        tempNode=nodeList(ii);
        stateMatrix(tempNode.location(1),tempNode.location(2))=tempNode.type;
    end
    imagesc(stateMatrix);
    % text([col],[row],'ID');
    % t1=text([1],[2],'4');
    % delete(t1);
    %%% add the types of the nodes on the image
    for ii=1:1:numel(nodeList)
        tempNode=nodeList(ii);
        text([tempNode.location(2)],[tempNode.location(1)],num2str(tempNode.type));    
    end
    for ii=1:1:length(noteIDs2Bplotted)
        [row,col]=ID2RowCol(XID,nodeList,noteIDs2Bplotted(ii));
        hold on; plot(col,row,'ro','MarkerSize',[20]);
    end
end

% function []=MapPlot(nodeList,noteIDs2Bplotted)
%     %% plot the MAP [for a given nodeList]
%     max_row_no=3;
%     max_col_no=3;
%     stateMatrix=zeros(max_row_no,max_col_no);
%     for ii=1:1:numel(nodeList)
%         tempNode=nodeList(ii);
%         stateMatrix(tempNode.location(1),tempNode.location(2))=tempNode.type;
%     end
%     imagesc(stateMatrix);
%     % text([col],[row],'ID');
%     % t1=text([1],[2],'4');
%     % delete(t1);
%     %%% add the types of the nodes on the image
%     for ii=1:1:numel(nodeList)
%         tempNode=nodeList(ii);
%         text([tempNode.location(2)],[tempNode.location(1)],num2str(tempNode.type));    
%     end
%     for ii=1:1:length(noteIDs2Bplotted)
%         [row,col]=ID2RowCol(nodeList,noteIDs2Bplotted(ii));
%         hold on; plot(col,row,'ro','MarkerSize',[20]);
%     end
% end