function NEW=GenChildren(XID,nodeList,nodeX)
    %% GenChildren
    % gimme a node and i ll give u the children
    % nodeID -> neighbor-node-IDs
    % GenChildren
    ChildrenIDs=findNeighborIDs(XID,nodeList,[nodeX.ID]);
    NEW=[];
    % we can make this for-loop better!
%     for ii=1:1:numel(nodeList)
%         if any(nodeList(ii).ID==ChildrenIDs)
%             NEW=[NEW,nodeList(ii)];
%         end
%     end
    for ii=1:1:length(ChildrenIDs)
        NEW=[NEW,nodeList(ChildrenIDs(ii))];
    end
end

