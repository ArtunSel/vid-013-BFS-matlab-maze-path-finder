clear all,close all,clc;
%%
fig1=figure(1);
pause(2);
% X = [5,0,0,0;
%      0,1,1,0;
%      0,1,0,0;
%      0,0,0,3];
% X = [5,0,0,0,0;
%      0,1,1,0,0;
%      0,1,0,0,0;
%      0,0,1,0,0;
%      0,0,1,0,3];
rng(111);
X = randi([0,1],10,9)

X(1,:)=0;
X(:,end)=0;
X(1,1)=5;
X(end,end)=3;
%
%% X2XID
numberOfNodes=length(X(:));
XID=reshape([1:1:numberOfNodes],size(X,2),size(X,1))';
%% node Object fields
% node.ID = [a number]
% node.depth = [a number]
% node.parent = [parent Node]
% node.searched = [boolean]
% node.location =[row,col]
% node.type=[Space,Rock,Start,End][0,1,5,3]
%%
% nodeList=[];
% node.ID = 1;              %--------
% node.depth = 0;
% node.parent = [];
% node.searched = [false];
% node.location =[1,1];       %--------
% node.type=[0];
% nodeList=[nodeList,node];
%% generate the nodes
nodeList=[];
for ii=1:1:length(XID(:))
    node.ID = ii;              %--------
    node.depth = 0;
    node.parent = [];
    node.searched = [false];
        [row,col] = find(XID==[ii]);
    node.location =[row,col];       %--------
    node.type=[0];
    nodeList=[nodeList,node];
end
%% update the "type" fields of each node in nodeList [start,end,wall,space]
[row,col]=find(X==1);
for ii=1:1:length(row)
    nodeList(RowCol2ID(XID,nodeList,row(ii),col(ii))).type=1;
end
[row,col]=find(X==5);
for ii=1:1:length(row)
    nodeList(RowCol2ID(XID,nodeList,row(ii),col(ii))).type=5;
end
[row,col]=find(X==3);
for ii=1:1:length(row)
    nodeList(RowCol2ID(XID,nodeList,row(ii),col(ii))).type=3;
end
%% initialization
% init-step-1 "define 2 sets called “open” and “closed”"
open=[];
closed=[];
% init-step-2 "update the depth,parent and search fields of S-node"
nodeList(1).depth=0;
nodeList(1).parent=[];
nodeList(1).searched=true;
% init-step-3 "add S to the open set" = "open←Append(S,open)"
open=[nodeList(1),open];
while(true)
    % "N=Head(open)"
    N=open(1);
    % "If GoalTest(N)==True return;"
    if N.type==3
        disp('SOLVED *****'); break;
    else
        %% STEP-1 "GenChildren"
        NEW=GenChildren(XID,nodeList,N); 
        %% STEP-2 FilterOut the "searched nodes" and "wall nodes"
        [NEW]=FilterOut(XID,nodeList,NEW);
        %% STEP-3 "update the parent field of each node in NEW"--------------
        for ii=1:1:numel(NEW)
            NEW(ii).parent=N;
        end
        %% STEP-4 "delete N from open"
        if numel(open)==1
            open=[];
        else
            open=open(2:end); 
        end
        %% STEP-5 "closed←Append(N,closed);"   
        closed=[N,closed];
        %% STEP-6 "New(i).depth=(N.depth)+1"   ---------------------------------
        for ii=1:1:numel(NEW)
            NEW(ii).depth=NEW(ii).parent.depth+1;
        end
        %% STEP-7 "New(i).searched=true"-----------------------------
        for ii=1:1:numel(NEW)
            NEW(ii).searched=true;
        end
        %% STEP-X "UPDATE nodeList"-----------------------------
        for ii=1:1:numel(NEW)
            nodeList(NEW(ii).ID)=NEW(ii);
        end
        %% STEP-8 "open← Append(open ,New);"
        open=[open,NEW]; % BFS
%         open=[NEW,open]; % DFS
        %% STEP-9 check if "open is empty"
        if ~(numel(open)>=1)
            disp('FAILURE to find a path');
            break;
        end
        % PLOT CLOSED SET
        noteIDs2Bplotted=[];
        for ii=1:1:numel(closed)
            noteIDs2Bplotted=[noteIDs2Bplotted,closed(ii).ID];
        end
        MapPlot(XID,nodeList,noteIDs2Bplotted);
        drawnow
%         pause(.1);        
    end
end
%% construct the path
tempNode=N
pathByIDs=[];
while(true)
    pathByIDs=[pathByIDs,tempNode.ID]
    tempNode=tempNode.parent;
    if tempNode.ID==1
        break;
    end
end
pathByIDs=[1,fliplr(pathByIDs)]
MapPlot(XID,nodeList,pathByIDs);




%