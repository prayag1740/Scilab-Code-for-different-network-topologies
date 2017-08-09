//This Program is Written  for finding the shortest path 
//This is the scilab code to find the Shortest path from source to destination in Mesh topology network using flood for 11 nodes. 
clear;
clc;

name='mesh topology with 11 nodes';// graph name
n=11;//no. of nodes
//every edge has head and tail.
tail=[2 3 4 3 4 5 5 5 5 6 6 6 6 6 7 7 7 7 7 7 8 8 8 8 8 8 8 9 9 9 9 9 9 9 9 10 10 10 10 10 10 10 10 10 11 11 11 11 11 11 11 11 11 11];// tail of eatch edge, this is a node from a edge or link is originating 
head=[1 2 3 1 2 1 2 3 4 1 2 3 4 5 1 2 3 4 5 6 1 2 3 4 5 6 7 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 10];//head of each edge,this is a node where edge or link is terminating 
// so, an edge can be represent as (tail,head),tail and head both are node no. eg.:   tail[1]=2,head[1]=1 means edge 1 is originating from 2 and terminating on 1 that implies there is an edge betweem node 1 and   node 2
node_x=[100 400 100 400 550 200 350 750 700 450 800];// x-coordinate of each node
node_y=[100 100 400 400 100 500 650 350 700 450 650];//y-coordinate of each node
[g]=NL_G_MakeGraph(name,n,tail,head,node_x,node_y)//application of NL_G_MakeGraph
N=length(g.node_x);//real network size
nl=length(g.head);//quantity of network links
[ne,nr]=NL_F_RandIntNiNj(N)//selection of two distinct nodes
TTL=5;//Time-To-Live update
[path]=NL_R_Flood(g,ne,nr,TTL)//application of NL_R_Flood
p=NL_G_Nodes2Path(path,g);//links of the shortest path
EC=ones(1,nl);//display the path between i and j: edge color
EB=1.5*ones(1,nl);//edge width
EC(p)=5;//define path color
EB(p)=5;//define width color
D=4*ones(1,N);//node border
D(path)=10;//node border for source to destination path
g.node_border=D;//node border
g.edge_color=EC;//define edge color
g.edge_width=EB;//edge width
ind=1;//window index
f=NL_G_ShowGraphN(g,ind);//graph visualization

