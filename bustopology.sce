//This Program is written for the objective of finding the shortest path 
//This is the scilab code to find the Shortest path from source to destination in bus topology network using flood for 12 nodes. 
clear;
clc;
name='Shortest path from s-->d in bus topology with 12 nodes using flood';// graph name
n=12;//no. of nodes
//every edge has head and tail.
tail=[1 2 3 4 5 6 2 3 4 5 6];//Ending Node of the connection 
head=[2 3 4 5 6 7 8 9 10 11 12];//Starting Nodes of the connection lines
// so, an edge can be represent as (tail,head),tail and head both are node no. eg.:   tail[1]=2,head[1]=1 means edge 1 is originating from 2 and terminating on 1 that implies there is an edge betweem node 1 and   node 2
node_x=[100 150 300 400 550 600 700 150 300 400 550 600];// x-coordinate of each node
node_y=[300 300 300 300 300 300 300 500 500 200 600 100];//y-coordinate of each node
[g]=NL_G_MakeGraph(name,n,tail,head,node_x,node_y)//Creates the Bus topoplogy
N=length(g.node_x);//Real network size
nl=length(g.head);//Quantity of network links
[ne,nr]=NL_F_RandIntNiNj(N)//Random Selection of two distinct nodes
TTL=15;//Time-To-Live update
[path]=NL_R_Flood(g,ne,nr,TTL)//Application of NL_R_Flood
p=NL_G_Nodes2Path(path,g);//Links of the shortest path
EC=ones(1,nl);//Display the path between i and j: edge color
EB=1.5*ones(1,nl);//Edge width
EC(p)=5;//Define path color
EB(p)=5;//Define width 
D=4*ones(1,N);//Node border
D(path)=10;//Node border for source to destination path
g.node_border=D;//Node border
g.edge_color=EC;//Define edge color
g.edge_width=EB;//Edge width
ind=1;//window index
f=NL_G_ShowGraphN(g,ind);//graph visualization


