import numpy as np
from scipy.io import loadmat
from PIL import Image

# 1. Load data dari file Im1D.mat
mat_data = loadmat('Im1D.mat')
Im1D = mat_data['Im1D']

# 2. Coba balik ukuran height dan width jika sebelumnya terbalik
# Biasanya database wajah standar ukurannya 112 (tinggi) x 92 (lebar)
height = 112
width = 92

# Ambil sampel gambar pertama
index_gambar = 0 
vektor_gambar = Im1D[index_gambar, :]

# 3. Ubah bentuk 1D ke 2D, lalu transpose (.T) jika orientasinya miring/terbalik
matrix_gambar = vektor_gambar.reshape((width, height)).T 
# Atau jika masih aneh, coba: matrix_gambar = vektor_gambar.reshape((height, width))

# 4. Normalisasi nilai piksel ke rentang 0-255
matrix_gambar = (matrix_gambar - matrix_gambar.min()) / (matrix_gambar.max() - matrix_gambar.min()) * 255
img_array = matrix_gambar.astype(np.uint8)

# 5. Simpan ulang gambar
img = Image.fromarray(img_array)
img.save(f"wajah_index_{index_gambar}.png")
print("Gambar berhasil diperbaiki dan disimpan ulang!")