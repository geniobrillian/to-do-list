<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="assets/styles/dashboard.css">
</head>

<body>
    <?php include 'includes/header.php'; ?>

    <div class="container">
        <h1>Selamat Datang, <?php echo htmlspecialchars($nama_user); ?></h1>
        <p>Kelola tugas Anda di bawah ini:</p>

        <!-- Form Tambah Tugas -->
        <form method="POST" action="add_tugas.php">
            <div class="form-group">
                <label for="nama_tugas">Nama Tugas</label>
                <input type="text" id="nama_tugas" name="nama_tugas" placeholder="Masukkan nama tugas" required>
            </div>
            <div class="form-group">
                <label for="deskripsi">Deskripsi</label>
                <textarea id="deskripsi" name="deskripsi" rows="4" placeholder="Masukkan deskripsi tugas"></textarea>
            </div>
            <div class="form-group">
                <label for="tanggal_deadline">Tanggal Deadline</label>
                <input type="date" id="tanggal_deadline" name="tanggal_deadline" required>
            </div>
            <button type="submit" name="tambah_tugas" class="btn btn-tambah">Tambah Tugas</button>
        </form>
        <div class="logout" id="logout">
            <a href="logout.php">Logout</a>
            <script>
                //js untuk konfirmasi logout
                document.getElementById("logout").addEventListener("click", function(event){
                    const konfirmasi = confirm("Apakah anda yakin ingin logout?");

                    if (!konfirmasi) {
                        event.preventDefault();
                        console.log("User membatalkan logout");
                    } else {
                        console.log("User mengkonfirmasi logout");
                    }
                });
            </script>
        </div>

        <!-- Daftar Tugas -->
        <h2>Daftar Tugas</h2>
        <table>
            <thead>
                <tr>
                    <th>Nama Tugas</th>
                    <th>Deskripsi</th>
                    <th>Tanggal Deadline</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($tugas)): ?>
                    <?php foreach ($tugas as $t): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($t['nama_tugas']); ?></td>
                            <td><?php echo htmlspecialchars($t['deskripsi']); ?></td>
                            <td><?php echo htmlspecialchars(date('d-m-Y',strtotime($t['tanggal_deadline']))); ?></td>
                            <td><?php echo htmlspecialchars($t['status_tugas']); ?></td>
                            <td>
                                <?php if ($t['status_tugas'] == 'belum'): ?>
                                    <a href="edit_tugas.php?id_tugas=<?php echo $t['id_tugas']; ?>" class="btn btn-edit">Edit</a>
                                <?php else: ?>
                                    <a href="edit_tugas.php?id_tugas=<?php echo $t['id_tugas']; ?>" class="btn btn-edit">Edit</a>
                                <?php endif; ?>
                                <!-- Form untuk hapus -->
                                <form method="POST" action="delete_tugas.php" style="display: inline;">
                                    <input type="hidden" name="hapus_id" value="<?php echo $t['id_tugas']; ?>">
                                    <button type="submit" class="btn btn-hapus" onclick="return confirm('Apakah Anda yakin ingin menghapus tugas ini?');">Hapus</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="5" style="text-align: center;">Belum ada tugas</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <?php include 'includes/footer.php'; ?>
    </body>
    </html>