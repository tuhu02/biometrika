from scipy.io import loadmat

# Load file matriks proyeksi
proj_data = loadmat('ProjectionMatric.mat')
print("Isi dari ProjectionMatric.mat:")
print(proj_data.keys()) # Melihat nama variabel di dalam file
print("Dimensi ProjectionMatric:", proj_data['ProjectionMatric'].shape)
print("Data ProjectionMatric:\n", proj_data['ProjectionMatric'])

# Load file matriks bobot
weight_data = loadmat('WeightMatric.mat')
print("\nIsi dari WeightMatric.mat:")
print(weight_data.keys())
print("Dimensi WeightMatric:", weight_data['WeightMatric'].shape)
print("Data WeightMatric:\n", weight_data['WeightMatric'])