clear
clc

load MyPhoto

%% pisahkan data training dan testing
MyTraining=MyPhoto(:,1:6);
MyTesting=MyPhoto(:,7:10);

save MyTraining MyTraining;
save MyTesting MyTesting;