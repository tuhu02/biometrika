clear
clc

MyFolder='D:\0_Face-2014\DataOrl\'
NumOfSubjects=40;
NumOfPoses=10;
MyExtension='.Jpg';

%% build Cell data structure

%% FileNameTemp has string type, Subject and Pose have numeric type
FileNameTemp='ORL_';

for Subject=1:NumOfSubjects
    for Pose=1:NumOfPoses
        MyFileName=[MyFolder  num2str(Subject) '\' FileNameTemp num2str(Subject) '_' num2str(Pose) MyExtension];
        MyPhoto{Subject,Pose}=imread(MyFileName);
    end
end

save MyPhoto MyPhoto;