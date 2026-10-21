clear
clc

%% pengukuran kemiripan
load ProjectionMatric;
load WeightMatric;
load MyTesting;

%% load data trauining
load Im1d;

%% Uji Data orang 1 pose ke 2 dari testing (ada 45 ambil kedua)
Test=MyTesting{10,1};
Test1Dim=reshape(Test, [1 112*92]);

%% Cari bobot testing
BobotTest=double(Test1Dim)*ProjectionMatric;

%% Bandingkan hasilnya dengan bobot
GandaBobotTest=repmat(BobotTest, [240 1]);

%% Hitung kemiripannya dengan membandingkan bobot
Hasil=abs(GandaBobotTest-WeightMatric);
Jarak=sum(Hasil,2);
[min posisi] = min(Jarak);
HasilAkhir=reshape(Im1D(posisi,:), [112 92]);
imshow([Test HasilAkhir]);

