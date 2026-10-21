%% Convert form 2 Dimensions into 1 Dimension

load MyTraining;
[NumOfSubjects NumOfPoses]= size(MyTraining);
[HeightI WeightI]=size(MyTraining{1,1});

%% Define initial variable, Im1D

Im1D=[];

%% convert 2 dimensions into 1 dimension
for Subject=1:NumOfSubjects
    for Pose=1:NumOfPoses
        ImOri2D = MyTraining{Subject,Pose};
        ImOri1D = reshape(ImOri2D, [1 HeightI*WeightI]);
        Im1D=[Im1D;ImOri1D];
    end
end

%% the Im1D has 260x10.304
save Im1D Im1D;
