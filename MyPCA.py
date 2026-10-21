import numpy as np
from scipy.io import loadmat, savemat

# 1. Load data Im1D dari file MAT MATLAB
mat_data = loadmat('Im1D.mat')
Im1D = mat_data['Im1D']

# Mendapatkan total data dan dimensi/fitur (setara dengan [TotalData, Sem] = size(Im1D))
TotalData, Sem = Im1D.shape
print(f"TotalData: {TotalData}, Sem: {Sem}")

# 2. Hitung Rata-Rata (Mean) setiap kolom
RataRata = np.mean(Im1D, axis=0)

# 3. Salin hasil mean sebanyak 240 baris (setara dengan repmat di MATLAB)
TempRataRata = np.tile(RataRata, (240, 1))

# 4. Hitung ZeroMean (Data dikurangi rata-rata)
ZeroMean = Im1D.astype(float) - TempRataRata

# 5. Hitung Matriks Kovarians (Reduksi Dimensi)
MyCov = np.dot(ZeroMean, ZeroMean.T) / (TotalData - 1)

# 6. Hitung Eigenvalue dan Eigenvector menggunakan SVD
V, E_vals, _ = np.linalg.svd(MyCov)

# 7. Hitung Matriks Proyeksi (Projection Matric)
ProjectionMatric = np.dot(ZeroMean.T, V)

# 8. Hitung Matriks Bobot (Weight Matric)
WeightMatric = np.dot(Im1D.astype(float), ProjectionMatric)

# 9. Simpan hasil ke file .mat (setara dengan perintah save di MATLAB)
savemat('ProjectionMatric.mat', {'ProjectionMatric': ProjectionMatric})
savemat('WeightMatric.mat', {'WeightMatric': WeightMatric})

print("Proses PCA selesai dan file hasil telah disimpan.")