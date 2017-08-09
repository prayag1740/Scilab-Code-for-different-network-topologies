//This Program is Written for finding the shortest path 
//This is the scilab code to find the Shortest path from source to destination in Tree topology network using flood for 14 nodes. 
clear;
clc;
name='shortest path from source to destinetion in star topology with 14 nodes using flood';// graph name
n=14;//graph parameters
//every edge has head and tail.
tail=[6 6 6 6 6 6 13 13 13 13 13 13 13];// tail of eatch edge, this is a node from a edge or link is originating 
head=[1 2 3 4 5 7 8 9 10 11 12 14 4];//head of each edge,this is a node where edge or link is terminating 
// so, an edge can be represent as (tail,head),tail and head both are node no. eg.:   tail[1]=6,head[1]=1 means edge 1 is originating from 6 and terminating on 1 that implies there is an edge betweem node 1 and   node 2
node_x=[100 400 100 400 250 300 500 800 600 400 700 600 650 850];// x-coordinate of each node
node_y=[100 100 400 400 500 200 300 800 350 550 750 850 550 550];//y-coordinate of each node
[g]=NL_G_MakeGraph(name,n,tail,head,node_x,node_y)//application of NL_G_MakeGraph
N=length(g.node_x);//real network size
nl=length(g.head);//quantity of network links
[ne,nr]=NL_F_RandIntNiNj(N)//selection of two distinct nodes
TTL=15;//Time-To-Live update
[path]=NL_R_Flood(g,ne,nr,TTL)//application of NL_R_Flood
p=NL_G_Nodes2Path(path,g);//links of the shortest path
EC=ones(1,nl);//display the path between i and j: edge color
EB=1.5*ones(1,nl);//edge width
EC(p)=5;//define path color
EB(p)=5;//define width 
D=4*ones(1,N);//node border
D(path)=10;//node border for source to destination path
g.node_border=D;//node border
g.edge_color=EC;//define edge color
g.edge_width=EB;//edge width
ind=1;//window index
f=NL_G_ShowGraphN(g,ind);//graph visualization


