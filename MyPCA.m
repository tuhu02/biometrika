load Im1D;
[TotalData Sem]=size(Im1D)


%% Calculate mean
RataRata=mean(Im1D,1);

%% copy mean result (240)
TempRataRata=repmat(RataRata, [240,1]);

%% calculate ZeroMean
ZeroMean=(double(Im1D)-TempRataRata);

%% Compute Covariance (Dimension Reduction)
MyCov=(ZeroMean*ZeroMean')/(TotalData-1)

%% calculate Eigenvalue and Eigenvector using Singular Value Decomposition
%% V represents Eigen Vector and E shows Eigen Value
[V E]=svd(MyCov);

%% Compute Projection Matric  
ProjectionMatric =ZeroMean'*V;

%% Normalization of the matrix result
%% RootSumSquareOfProjectionMatric=(1./(sum(ProjectionMatric.^2).^0.5));

%% ProjectionMatric  =bsxfun(@times,ProjectionMatric, RootSumSquareOfProjectionMatric);
%% ProjectionMatric =transpose(ProjectionMatric);

%% 6. Compute Weight Matric
WeightMatric = double(Im1D)*ProjectionMatric;

save ProjectionMatric ProjectionMatric;
save WeightMatric WeightMatric;