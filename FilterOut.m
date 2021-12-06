function [NEW]=FilterOut(XID,nodeList,NEW)
    %% FilterOut Function
    % FilterOut "if searched"
    NEW2=[];
    for ii=1:1:numel(NEW)
        if NEW(ii).searched==false % filter out the previously-searched-nodes
            NEW2=[NEW2,NEW(ii)];
        end
    end
    % FilterOut "the wall-nodes"
    NEW3=[];
    for ii=1:1:numel(NEW2)
        if ~(NEW2(ii).type==1) % || if it is not a wall
            NEW3=[NEW3,NEW2(ii)];
        end
    end
    NEW=[];
    NEW=NEW3;
end

