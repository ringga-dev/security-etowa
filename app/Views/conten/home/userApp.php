<?= $this->extend('base_ui/ui_tamplate'); ?>
<?= $this->extend('base_ui/base_menu'); ?>
<?= $this->section('content'); ?>

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>

                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <form action="<?= base_url('AdminControl/produc') ?>" method="POST" class="col-md-12  text-right">
                            <div class="row text-right ml-2 mr-2">
                                <select type="text" class="custom-select col mr-2" id="kategori" name="kategori">
                                    <option value="">Filter</option>


                                </select>
                                <button type="submit" class="btn btn-warning mr-2 center"><i class="fas fa-search fa-2x"></i></button>
                                <a href="" class="btn btn-info mr-2 center" data-toggle="modal" data-target="#modal-xl"><i class="fas fa-plus-square fa-2x"></i></a>
                            </div>

                        </form>
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Bet</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Devisi</th>
                                    <th>Image</th>
                                    <th>Created</th>
                                    <th>Created_by</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <?php $i = 0;
                                foreach ($user as $u) :
                                    $i++ ?>
                                    <tr>
                                        <td class="text-center"><?= $u['name']; ?></td>
                                        <td class="text-center"><?= $u['id_bet']; ?></td>
                                        <td class="text-center"><?= $u['email']; ?></td>
                                        <td class="text-center"><?= $u['no_phone']; ?></td>
                                        <td class="text-center"><?= $u['devisi']; ?></td>
                                        <td class="text-center"><?= $u['image']; ?></td>
                                        <td class="text-center"><?= $u['created']; ?></td>
                                        <td class="text-center"><?= $u['created_by']; ?></td>

                                        <td class="text-center">
                                            <a href="<?= base_url() ?>/admin/deleteUserApp/<?= $u['id']; ?>" class="badge badge-danger m-1 hapus"><i class="fas fa-trash-alt fa-2x"></i></a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Bet</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Devisi</th>
                                    <th>Image</th>
                                    <th>Created</th>
                                    <th>Created_by</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- ./card-body -->

                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->



    </div>
    <!--/. container-fluid -->
</section>
<!-- /.content -->

<!-- modal userapp add -->
<div class="modal fade" id="modal-xl">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">ADD Form</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- class="was-validated" -->
            <form action="<?= base_url() ?>/admin/action_user" method="POST" enctype="multipart/form-data">
                <?= csrf_field() ?>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="nama_barang">Name</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="name" name="name" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="harga">Bet</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="id_bet" name="id_bet" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="jumlah">Email</label>
                                    <div class="input-group">
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="jumlah">Number Phone</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="no_phone" name="no_phone" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="jumlah">Devisi</label>
                                    <select type="text" class="custom-select rounded-0" id="devisi" name="devisi">
                                        <option value="">No Join to List</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.col (RIGHT) -->
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>


    </div>
</div>

<script>
    $.ajax({
        type: "post",
        url: "<?= base_url('globalview/devisi') ?>",
        dataType: "json",
        success: function(response) {
            console.log(response)
            response.forEach(function(data) {
                $('#devisi').append(`<option value="${data.privilege_name}">
                                   ${data.privilege_name}
                                  </option>`);
            })

        }
    });
</script>

<?= $this->endSection(); ?>