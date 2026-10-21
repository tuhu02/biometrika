load MyTesting
[S U]=size(MyTesting)

All=[]
for NumOfS=1:10
    Poto=[];
    for NumofU=1:U
        Poto=[Poto MyTesting{NumOfS,NumofU}];
    end
    All=[All;Poto]
end
imshow(All);
