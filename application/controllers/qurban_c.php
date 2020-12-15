<?php

defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class qurban_c extends RestController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('qurban_m', 'qm');
        $this->methods['index_get']['limit'] = 2;
    }
    public function index_get()
    {
        $id = $this->get('id', true);
        if ($id == null) {
            $p = $this->get('page');
            $p = (empty($p) ? 1 : $p); //jika $p kosong maka halaman 1 : jika didefinisikan sesuai $p
            $total_data = $this->qm->count();
            $total_page = ceil($total_data / 5);
            $start = ($p - 1) * 5;
            $list = $this->qm->get(null, 5, $start);
            if ($list) {
                $data = [
                    'status' => true,
                    'page' => $p,
                    'total_data' => $total_data,
                    'total_page' => $total_page,
                    'data' => $list
                ];
            } else {
                $data = [
                    'status' => false,
                    'msg' => 'Data tidak ada'
                ];
            }
            $this->response($data, RestController::HTTP_OK);
        } else {
            $data = $this->qm->get($id);
            if ($data) {
                $this->response(['status' => true, 'data' => $data], RestController::HTTP_OK);
            } else {
                $this->response(['status' => false, 'msg' => $id . ' Tidak Ada'], RestController::HTTP_NOT_FOUND);
            }
        }
    }
    public function index_post()
    {
        $data = [
            'nama' => $this->post('nama', true),
            'alamat' => $this->post('alamat', true),
            'telpon' => $this->post('nomor', true),
            'hewan' => $this->post('hewan', true)
        ];
        $simpan = $this->qm->add($data);
        if ($simpan['status']) {
            $this->response(['status' => true, 'msg' => $simpan['data'] . ' Data telah ditambahkan'], RestController::HTTP_CREATED);
        } else {
            $this->response(['status' => false, 'msg' => $simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
        }
    }
    public function index_put()
    {
        $data = [
            'kode_qurban' => $this->put('kode'),
            'nama' => $this->put('nama', true),
            'alamat' => $this->put('alamat', true),
            'telpon' => $this->put('nomor', true),
            'hewan' => $this->put('hewan', true)
        ];
        $id = $this->put('id', true);
        if ($id == null) {
            $this->response(['status' => false, 'msg' => 'Masukkan Nomor telpon yang akan dirubah'], RestController::HTTP_BAD_REQUEST);
        }
        $simpan = $this->qm->update($id, $data);
        if ($simpan['status']) {
            $status = (int) $simpan['data'];
            if ($status > 0) {
                $this->response(['status' => true, 'msg' => $simpan['data'] . ' Data telah diubah'], RestController::HTTP_OK);
            } else {
                $this->response(['status' => false, 'msg' => 'Tidak ada data yang dirubah'], RestController::HTTP_BAD_REQUEST);
            }
        } else {
            $this->response(['status' => false, 'msg' => $simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
        }
    }
    public function index_delete()
    {
        $id = $this->delete('id');
        if ($id == null) {
            $this->response(['status' => false, 'msg' => 'Masukkan Nomor telpon yang akan dihapus'], RestController::HTTP_BAD_REQUEST);
        }
        $hapus = $this->qm->delete($id);
        if ($hapus['status']) {
            $status = (int) $hapus['data'];
            if ($status > 0) {
                $this->response(['status' => true, 'msg' => $id . ' Data telah dihapus'], RestController::HTTP_OK);
            } else {
                $this->response(['status' => false, 'msg' => 'Tidak ada data yang dihapus'], RestController::HTTP_BAD_REQUEST);
            }
        } else {
            $this->response(['status' => false, 'msg' => $hapus['msg']], RestController::HTTP_INTERNAL_ERROR);
        }
    }
}
